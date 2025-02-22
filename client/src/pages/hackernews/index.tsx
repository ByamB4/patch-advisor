import { MainLayout } from "@/layouts";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import Image from "next/image";
import { Typography } from "@mui/material";
import { db } from "@/server";
import { IHackerNews } from "@/interfaces";
import Link from "next/link";
import { IoCalendarOutline } from "react-icons/io5";
import { convertToLocalTime } from "@/utils";

const HackerNewsPage: NextPage<{ initialData: IHackerNews[] }> = ({ initialData }): React.ReactElement => {
  return (
    <MainLayout>
      <section className="flex justify-center">
        <div className="flex flex-col gap-12 py-5 max-w-6xl">
          {initialData.map((it) => (
            <div key={it.title} className="flex gap-4">
              <Link href={`/hackernews/${it.title}`}>
                <Image alt={it.title} width={300} height={300} src={it.img} className="rounded-lg" />
              </Link>
              <div className="flex flex-col justify-center gap-4 w-full">
                <Link href={`/hackernews/${it.title}`}>
                  <Typography variant="h5">{it.title}</Typography>
                </Link>
                <div className="flex justify-between">
                  <div className="flex items-center gap-2">
                    <IoCalendarOutline size={16} />
                    <Typography variant="subtitle2">{convertToLocalTime(it.date)}</Typography>
                  </div>
                  <Typography variant="subtitle2">{it.category}</Typography>
                </div>
                <Typography variant="body1" className="text-gray-700">
                  {it.description.substring(0, 200)}...
                </Typography>
              </div>
            </div>
          ))}
        </div>
      </section>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  return {
    props: {
      initialData: JSON.parse(
        JSON.stringify(
          await db.hackernews.findMany({
            orderBy: {
              date: "desc",
            },
            select: {
              date: true,
              description: true,
              img: true,
              title: true,
              category: true,
            },
          })
        )
      ),
    },
  };
};
export default HackerNewsPage;
