import { MainLayout } from "@/layouts";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { REDHAT_TABS } from "@/constants/configs";
import { useState } from "react";
import { MARGIN_Y, PADDING_X } from "@/constants/layout";
import { Button, Tab, Tabs, Typography, Pagination } from "@mui/material";
import { IoMdRefresh } from "react-icons/io";
import { RedHatList } from "@/ui/redhat";
import { IRedhat } from "@/interfaces";
import { db } from "@/server";

const RedhatPage: NextPage<{ data: IRedhat[] }> = ({ data }): React.ReactElement => {
  const [tabNumber, setTabNumber] = useState<number>(0);
  const [page, setPage] = useState<number>(1);
  const postPerPage: number = 10;
  const enhancementData = [...data.filter((it) => it.severity.includes("Enhancement"))];
  const bugFix = [...data.filter((it) => it.severity.includes("Bug Fix Advisory"))];
  const securityAdvisory = [...data.filter((it) => it.severity.includes("Security Advisory"))];

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
                {REDHAT_TABS.map((it, _: number) => (
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
              <RedHatList data={data.slice((page - 1) * postPerPage, page * postPerPage)} />
            ) : tabNumber === 1 ? (
              <RedHatList data={enhancementData.slice((page - 1) * postPerPage, page * postPerPage)} />
            ) : tabNumber === 2 ? (
              <RedHatList data={bugFix.slice((page - 1) * postPerPage, page * postPerPage)} />
            ) : tabNumber === 3 ? (
              <RedHatList data={securityAdvisory.slice((page - 1) * postPerPage, page * postPerPage)} />
            ) : (
              <></>
            )}
          </div>
          <div className="flex items-center justify-center">
            <Pagination
              size="large"
              count={Math.ceil((tabNumber === 0 ? data.length : tabNumber === 1 ? enhancementData.length : tabNumber === 2 ? bugFix.length : securityAdvisory.length) / postPerPage)}
              defaultPage={1}
              onChange={(e, val) => setPage(val)}
              variant="outlined"
              color="primary"
            />
          </div>
        </div>
      </div>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  return {
    props: {
      data: await db.redhat.findMany({
        orderBy: {
          date: "desc",
        },
      }),
    },
  };
};

export default RedhatPage;
