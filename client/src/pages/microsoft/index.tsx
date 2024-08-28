import { MainLayout } from "@/layouts";
import { NextPage } from "next";
import { MICROSOFT_TABS, PADDING_X, MARGIN_T } from "@/constants/configs";
import { useEffect, useState } from "react";
import { Button, Tab, Tabs, Typography } from "@mui/material";
import { IoMdRefresh } from "react-icons/io";
import { GetServerSideProps, GetServerSidePropsResult } from "next";
import { db } from "@/server";
import { IMicrosoft } from "@/interfaces";
import MicrosoftUI from "@/ui/microsoft/list";

interface Props {
  data: IMicrosoft[];
}

const MicrosoftPage: NextPage<Props> = ({ data = [] }): React.ReactElement => {
  const [tabNumber, setTabNumber] = useState<number>(0);

  useEffect(() => {
    console.log(data);
  }, []);

  return (
    <MainLayout NO_PADDING>
      <div>
        <section className={`${MARGIN_T} border-b`}>
          <div className={`${PADDING_X}`}>
            <div className="flex justify-between">
              <Typography variant="h1">Patch Advisor</Typography>
              <Button variant="contained" size="medium" startIcon={<IoMdRefresh />}>
                Rescan
              </Button>
            </div>
            <div className="mt-5">
              <Tabs value={tabNumber} onChange={(event, val) => setTabNumber(+val)} aria-label="homepage-tabs">
                {MICROSOFT_TABS.map((it, _: number) => (
                  <Tab
                    key={it.id}
                    value={_}
                    label={
                      <div className="flex gap-2 items-center">
                        <span>{it.title}</span>
                        {it.unread > 0 && (
                          <div className="bg-secondary-roseWhite border-secondary-lightPeach border-2 rounded-full px-1">
                            <Typography variant="caption" className="text-text-grey">
                              2
                            </Typography>
                          </div>
                        )}
                      </div>
                    }
                  />
                ))}
              </Tabs>
            </div>
          </div>
        </section>
        <section className={`bg-white min-h-screen ${PADDING_X}`}>
          <div className="py-5">{tabNumber === 0 ? <MicrosoftUI data={data} /> : <></>}</div>
        </section>
      </div>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  return {
    props: {
      data: JSON.parse(
        JSON.stringify(
          await db.microsoft.findMany({
            orderBy: {
              release_date: "desc",
            },
          })
        )
      ),
    },
  };
};

export default MicrosoftPage;
