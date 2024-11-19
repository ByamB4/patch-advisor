import { MainLayout } from "@/layouts";
import { NextPage } from "next";
import { MICROSOFT_TABS, PADDING_X, MARGIN_T, CURRENT_MONTH } from "@/constants/configs";
import { useEffect, useRef, useState } from "react";
import { Button, Tab, Tabs, Typography } from "@mui/material";
import { GetServerSideProps, GetServerSidePropsResult } from "next";
import { db } from "@/server";
import { IMicrosoft } from "@/interfaces";
import MicrosoftUI from "@/ui/microsoft/list";
import { LuSearch } from "react-icons/lu";
import DownloadAsExcel from "@/components/download_excel";

interface Props {
  initialData: IMicrosoft[];
}

const MicrosoftPage: NextPage<Props> = ({ initialData = [] }): React.ReactElement => {
  const [tabNumber, setTabNumber] = useState<number>(0);
  const [data, setData] = useState<IMicrosoft[]>(initialData);
  const inputRef = useRef(null);

  const handleSubmit = async () => {
    const searchValue: any = (inputRef?.current as any)?.value || "";
    const res = (await fetch(`/api/microsoft_search?search=${searchValue}`)).json();
    setData(await res);
  };

  useEffect(() => {
    if (tabNumber === 0) {
      setData(initialData);
    } else if (tabNumber === 1) {
      setData(
        data.filter((it: IMicrosoft) => {
          const itemDate = new Date(it.release_date);
          return itemDate.getMonth() === CURRENT_MONTH;
        })
      );
    }
  }, [tabNumber]);

  return (
    <MainLayout NO_PADDING>
      <div>
        <section className={`${MARGIN_T} border-b`}>
          <div className={`${PADDING_X}`}>
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

                <DownloadAsExcel label="microsoft" data={data} />
              </form>
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
          <div className="py-5">{<MicrosoftUI data={data} />}</div>
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
