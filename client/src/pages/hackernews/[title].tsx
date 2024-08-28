import { Breadcrumbs, Typography } from "@mui/material";
import { MdOutlineNavigateNext } from "react-icons/md";
import Link from "next/link";
import { MainLayout } from "@/layouts";
import { IHackerNews } from "@/interfaces";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { convertToLocalTime, renderSynopsis } from "@/utils";
import { db } from "@/server";
import Image from "next/image";

const HackernewsDetail: NextPage<{
  data: IHackerNews;
  success: boolean;
  className: string;
}> = ({ className = "", data }): React.ReactElement => {
  const breadcrumbs = [
    <Link key="1" color="primary" href="/">
      <span className="font-medium">Homepage</span>
    </Link>,
    <Typography key="3" color="text.primary">
      {data.title}
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
              {data.title}
            </Typography>
            <div className="flex gap-16">
              <Typography variant="subtitle1" className="text-text-darkGrey">
                Date: <span className="font-semibold">{convertToLocalTime(data.date)}</span>
              </Typography>
            </div>
          </div>
        </section>
        <section>
          <Image alt={data.title} width={700} height={700} src={data.img} className="rounded-lg" />
          <div className="flex flex-col gap-4" dangerouslySetInnerHTML={{ __html: data.page_content.replace(/<img[^>]*>/g, "") }} />
        </section>
      </main>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  const title = context?.params?.title;
  if (typeof title === "string") {
    return {
      props: {
        data: JSON.parse(
          JSON.stringify(
            await db.hackernews.findFirst({
              where: {
                title: title,
              },
            })
          )
        ),
      },
    };
  }
  return {
    props: {
      data: {},
    },
  };
};

export default HackernewsDetail;
