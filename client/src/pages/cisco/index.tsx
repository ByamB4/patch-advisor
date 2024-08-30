import { MainLayout } from "@/layouts";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { CISCO_TABS, CURRENT_MONTH, MARGIN_T, PADDING_X } from "@/constants/configs";
import { useEffect, useRef, useState } from "react";
import { Button, Tab, Tabs, Typography } from "@mui/material";
import { LuSearch } from "react-icons/lu";
import { CiscoList } from "@/ui/cisco";
import { ICisco } from "@/interfaces";
import { db } from "@/server";

const CiscoPage: NextPage<{
  initialData: ICisco[];
}> = ({ initialData }): React.ReactElement => {
  const [tabNumber, setTabNumber] = useState<number>(0);
  const [data, setData] = useState<ICisco[]>(initialData);
  const inputRef = useRef(null);

  const handleSubmit = async () => {
    const searchValue: any = (inputRef?.current as any)?.value || "";
    const res = (await fetch(`/api/cisco_search?search=${searchValue}`)).json();
    setData(await res);
  };

  useEffect(() => {
    if (tabNumber === 0) {
      setData(initialData);
    } else if (tabNumber === 4) {
      setData(
        data.filter((it: ICisco) => {
          const itemDate = new Date(it.lastUpdated);
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
              </form>
            </div>
            <div className="mt-5">
              <Tabs value={tabNumber} onChange={(event, val) => setTabNumber(+val)} aria-label="homepage-tabs">
                {CISCO_TABS.map((it, _: number) => (
                  <Tab
                    key={it.id}
                    value={_}
                    label={
                      <div className="flex gap-2 items-center">
                        <span>{it.title}</span>
                      </div>
                    }
                  />
                ))}
              </Tabs>
            </div>
          </div>
        </section>
        <section className={`bg-white min-h-screen ${PADDING_X}`}>
          <div className="py-5">
            {tabNumber === 0 ? (
              <CiscoList data={data} />
            ) : tabNumber === 1 ? (
              <CiscoList data={[...data.filter((it) => it.sir.includes("Medium"))]} />
            ) : tabNumber === 2 ? (
              <CiscoList data={[...data.filter((it) => it.sir.includes("High"))]} />
            ) : tabNumber === 3 ? (
              <CiscoList data={[...data.filter((it) => it.sir.includes("Critical"))]} />
            ) : tabNumber === 4 ? (
              <CiscoList data={data} />
            ) : (
              <></>
            )}
          </div>
        </section>
      </div>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  return {
    props: {
      initialData: await db.cisco.findMany({
        orderBy: {
          lastUpdated: "desc",
        },
      }),
    },
  };
};

export default CiscoPage;
