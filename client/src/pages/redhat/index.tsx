import { MainLayout } from "@/layouts";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { REDHAT_TABS } from "@/constants/configs";
import { useState, useRef } from "react";
import { MARGIN_Y, PADDING_X } from "@/constants/layout";
import { Button, Tab, Tabs, Typography, Pagination } from "@mui/material";
import { LuSearch } from "react-icons/lu";
import { RedHatList } from "@/ui/redhat";
import { ICSAF } from "@/interfaces";
import { db } from "@/server";
import axios from "axios";

const RedhatPage: NextPage<{ initialData: ICSAF[] }> = ({ initialData }): React.ReactElement => {
  const [tabNumber, setTabNumber] = useState<number>(0);
  const [data, setData] = useState<ICSAF[]>(initialData);
  const inputRef = useRef(null);
  const [page, setPage] = useState<number>(1);
  const postPerPage: number = 100;

  const handleSubmit = async () => {
    const searchValue: any = (inputRef?.current as any)?.value || "";
    const res = (await fetch(`/api/redhat_search?search=${searchValue}`)).json();
    setData(await res);
  };

  return (
    <MainLayout NO_PADDING>
      <div className={`${MARGIN_Y}`}>
        <div className="border-b">
          <div className={`${PADDING_X}`}>
            <div className="flex justify-between">
              <Typography variant="h1">Patch Advisor</Typography>
              <div className="flex gap-2">
                <input type="text" ref={inputRef} className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 p-2.5" placeholder="CVE" />
                <Button variant="contained" size="medium" startIcon={<LuSearch />} onClick={() => handleSubmit()}>
                  Search
                </Button>
              </div>
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
            <RedHatList data={data.slice((page - 1) * postPerPage, page * postPerPage)} />
          </div>
          <div className="flex items-center justify-center">
            <Pagination size="large" count={Math.ceil(data.length / postPerPage)} defaultPage={1} onChange={(e, val) => setPage(val)} variant="outlined" color="primary" />
          </div>
        </div>
      </div>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  return {
    props: {
      initialData: await db.redhat.findMany({
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
        },
      }),
    },
  };
};

export default RedhatPage;
