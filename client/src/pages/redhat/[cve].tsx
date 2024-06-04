import { Breadcrumbs, Link, Typography } from "@mui/material";
import { MdOutlineNavigateNext } from "react-icons/md";
import { MainLayout } from "layouts";
import { IRedhat } from "interfaces";
import { useRouter } from "next/router";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { db } from "server";

const RedhatDetail: NextPage<{
  data: IRedhat;
  success: boolean;
  className: string;
}> = ({ className = "", data, success = false }): React.ReactElement => {
  const router = useRouter();
  const breadcrumbs = [
    <Link underline="hover" key="1" color="primary" href="/redhat" onClick={() => router.push("/redhat")}>
      <span className="font-medium">Red Hat Product Errata</span>
    </Link>,
    <Typography key="3" color="text.primary">
      {data.cve}
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
              {data.cve}
            </Typography>
            <div className="flex gap-16">
              <Typography variant="subtitle2" className="text-text-darkGrey">
                Issued: 2024-03-07
              </Typography>
              <Typography variant="subtitle2" className="text-text-darkGrey">
                Updated: 2024-03-07
              </Typography>
            </div>
          </div>
          <div className="flex flex-col gap-2">
            <Typography variant="h4" className="text-primary-dark">
              Synopsis
            </Typography>
            <Typography variant="subtitle1" className="text-primary-dark3">
              {data.synopsis}
            </Typography>
          </div>
          <div className="flex flex-col gap-2">
            <Typography variant="h4" className="text-primary-dark">
              Type/Severity
            </Typography>
            <Typography variant="subtitle1" className="text-primary-dark3">
              {data.severity}
            </Typography>
          </div>
          <div className="flex flex-col gap-2">
            <Typography variant="h4" className="text-primary-dark">
              Topic
            </Typography>
            <Typography variant="subtitle1" className="text-primary-dark3">
              {data.topics}
            </Typography>
          </div>
          <div
            dangerouslySetInnerHTML={{
              __html: data.description,
            }}
          />
          <div
            dangerouslySetInnerHTML={{
              __html: data.solution,
            }}
          />
          <div
            dangerouslySetInnerHTML={{
              __html: data.affected_products,
            }}
          />
          <div
            dangerouslySetInnerHTML={{
              __html: data.fixes,
            }}
          />
          <div
            dangerouslySetInnerHTML={{
              __html: data.cves,
            }}
          />
          <div
            dangerouslySetInnerHTML={{
              __html: data.references,
            }}
          />
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
            cve: cve,
          },
        }),
        success: true,
      },
    };
  }
  return {
    props: {
      success: false,
      data: {},
    },
  };
};

export default RedhatDetail;
