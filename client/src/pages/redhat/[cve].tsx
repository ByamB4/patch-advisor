import { Breadcrumbs, Typography } from "@mui/material";
import { MdOutlineNavigateNext } from "react-icons/md";
import Link from "next/link";
import { MainLayout } from "@/layouts";
import { ICSAF } from "@/interfaces";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { convertToLocalTime, renderSynopsis } from "@/utils";
import { db } from "@/server";

const RedhatDetail: NextPage<{
  data: ICSAF;
  success: boolean;
  className: string;
}> = ({ className = "", data }): React.ReactElement => {
  const breadcrumbs = [
    <Link key="1" color="primary" href="/redhat">
      <span className="font-medium">Red Hat Product Errata</span>
    </Link>,
    <Typography key="3" color="text.primary">
      {data.RHSA}
    </Typography>,
  ];

  return (
    <MainLayout className={`${className}`}>
      <main className="mx-24">
        <Breadcrumbs separator={<MdOutlineNavigateNext fontSize="small" />} aria-label="breadcrumb">
          {breadcrumbs}
        </Breadcrumbs>
        <section className="flex flex-col gap-8">
          <div className="my-5 flex justify-between">
            <Typography variant="h3" className="text-primary-dark">
              {data.RHSA}
            </Typography>
            <div className="flex gap-16">
              <Typography variant="subtitle1" className="text-text-darkGrey">
                Released on: {convertToLocalTime(data.released_on)}
              </Typography>
            </div>
          </div>
          <div className="flex flex-col gap-2">
            <Typography variant="h3" className="text-primary-dark">
              Synopsis
            </Typography>
            <Typography variant="h6" className="text-primary-dark3">
              {renderSynopsis(data.document.title)}
            </Typography>
          </div>
          <div className="flex flex-col gap-2">
            <Typography variant="h3" className="text-primary-dark">
              Type/Severity
            </Typography>
            <Typography variant="h6" className="text-primary-dark3">
              Security Advisory: {data.severity}
            </Typography>
          </div>
          <div className="flex flex-col gap-6">
            {data.document.notes.map((it) => (
              <div key={it.title} className="flex flex-col gap-4">
                <Typography variant="h3" className="text-primary-dark">
                  {it.title}
                </Typography>
                <Typography variant="h6">
                  <div dangerouslySetInnerHTML={{ __html: it.text }} />
                </Typography>
              </div>
            ))}
          </div>
          <div className="flex flex-col gap-2">
            <Typography variant="h3" className="text-primary-dark">
              Solution
            </Typography>
            {data.vulnerabilities[0] && <Typography variant="h6">{data.vulnerabilities[0]["remediations"][0]["details"]}</Typography>}
          </div>
          <div className="flex flex-col gap-2">
            <Typography variant="h3" className="text-primary-dark">
              References
            </Typography>
            <div>
              {data.vulnerabilities.map((it) => (
                <div key={it.cve} className="flex items-center gap-2">
                  <Link href={`https://access.redhat.com/errata/${data.RHSA}`}>
                    <Typography variant="h6">{it.cve}</Typography>
                  </Link>
                  -<Typography variant="h6">{it.title}</Typography>
                </div>
              ))}
            </div>
          </div>
        </section>
      </main>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  const cve = context?.params?.cve;
  if (typeof cve === "string") {
    return {
      props: {
        data: await db.redhat.findFirst({
          where: {
            RHSA: cve,
          },
          include: {
            document: {
              select: {
                title: true,
                notes: true,
                tracking: {
                  select: {
                    current_release_date: true,
                  },
                },
                aggregate_severity: {
                  select: {
                    text: true,
                  },
                },
              },
            },
            vulnerabilities: {
              select: {
                remediations: true,
                cve: true,
                title: true,
              },
            },
          },
        }),
      },
    };
  }
  return {
    props: {
      data: {},
    },
  };
};

export default RedhatDetail;
