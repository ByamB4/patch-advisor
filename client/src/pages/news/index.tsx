import { MainLayout } from "@/layouts";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { useState } from "react";
import { MARGIN_Y, PADDING_X, NEWS_TABS } from "@/constants/configs";
import { Button, Tab, Tabs, Typography } from "@mui/material";
import { IoMdRefresh } from "react-icons/io";

const NewsPage: NextPage = (): React.ReactElement => {
  const [tabNumber, setTabNumber] = useState<number>(0);

  return (
    <MainLayout NO_PADDING>
      <div className={`${MARGIN_Y}`}>
        <div className="border-b">
          <div className={`${PADDING_X}`}>
            <div className="flex justify-between">
              <Typography variant="h1">Patch Advisor</Typography>
              <Button variant="contained" size="medium" startIcon={<IoMdRefresh />}>
                Rescan
              </Button>
            </div>
            <div className="mt-5">
              <Tabs value={tabNumber} onChange={(event, val) => setTabNumber(+val)} aria-label="homepage-tabs">
                {NEWS_TABS.map((it, _: number) => (
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
        </div>
        <div className={`bg-white min-h-screen ${PADDING_X}`}>
          <div className="py-5">
            {tabNumber === 0 ? (
              <h1>the hacker news</h1>
            ) : // <RedHatList data={data.slice((page - 1) * postPerPage, page * postPerPage)} />
            tabNumber === 1 ? (
              <h1>bleeping computer</h1>
            ) : (
              <></>
            )}
          </div>
        </div>
      </div>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  return {
    props: {
      data: [],
    },
  };
};

export default NewsPage;
