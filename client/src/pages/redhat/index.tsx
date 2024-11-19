import { MainLayout } from "@/layouts";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { REDHAT_TABS, MARGIN_T, PADDING_X, POST_PER_PAGE, CURRENT_MONTH } from "@/constants/configs";
import { useState, useRef, useEffect } from "react";
import { Button, Tab, Tabs, Typography, Pagination } from "@mui/material";
import { LuSearch } from "react-icons/lu";
import { RedHatList } from "@/ui/redhat";
import { ICSAF } from "@/interfaces";
import { db } from "@/server";
import DownloadAsExcel from "@/components/download_excel";

const RedhatPage: NextPage<{ initialData: ICSAF[] }> = ({ initialData }): React.ReactElement => {
  const [tabNumber, setTabNumber] = useState<number>(0);
  const [data, setData] = useState<ICSAF[]>(initialData);
  const inputRef = useRef(null);
  const [page, setPage] = useState<number>(1);

  const handleSubmit = async () => {
    const searchValue: any = (inputRef?.current as any)?.value || "";
    const res = (await fetch(`/api/redhat_search?search=${searchValue}`)).json();
    setData(await res);
  };

  useEffect(() => {
    if (tabNumber === 0) {
      setData(initialData);
      console.log(data);
    } else if (tabNumber === 1) {
      setData(
        data.filter((it: ICSAF) => {
          const itemDate = new Date(it.document.tracking.current_release_date);
          return itemDate.getMonth() === CURRENT_MONTH;
        })
      );
    }
    setPage(1);
  }, [tabNumber]);

  return (
    <MainLayout NO_PADDING>
      <div>
        <section className={`${MARGIN_T} border-b`}>
          <div className={`flex flex-col gap-6 ${PADDING_X}`}>
            <div className="flex justify-between">
              <Typography variant="h1">Patch Advisor</Typography>
              <form
                className="flex gap-2"
                onSubmit={(e) => {
                  e.preventDefault();
                  handleSubmit();
                }}
              >
                <input type="text" ref={inputRef} className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 p-2.5" placeholder="CVE" />
                <Button variant="contained" size="medium" startIcon={<LuSearch />} onClick={() => handleSubmit()}>
                  Search
                </Button>
                <DownloadAsExcel label="redhat" data={data} />
              </form>
            </div>
            <div>
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
                              {it.unread}
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
        <section className={`bg-white ${PADDING_X}`}>
          <div className="py-5">
            {tabNumber === 0 ? (
              <RedHatList data={data.slice((page - 1) * POST_PER_PAGE, page * POST_PER_PAGE)} />
            ) : tabNumber === 1 ? (
              <RedHatList data={data.slice((page - 1) * POST_PER_PAGE, page * POST_PER_PAGE)} />
            ) : (
              <></>
            )}
          </div>
          <div className="flex items-center justify-center py-12">
            <Pagination size="large" count={Math.ceil(data.length / POST_PER_PAGE)} defaultPage={1} onChange={(e, val) => setPage(val)} variant="outlined" color="primary" />
          </div>
        </section>
      </div>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  return {
    props: {
      initialData: JSON.parse(
        JSON.stringify(
          await db.redhat.findMany({
            orderBy: {
              document: {
                tracking: {
                  current_release_date: "desc",
                },
              },
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
            },
          })
        )
      ),
    },
  };
};

export default RedhatPage;
