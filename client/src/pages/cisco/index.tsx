import { MainLayout } from "layouts";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { CISCO_TABS } from "constants/configs";
import { useState } from "react";
import { MARGIN_Y, PADDING_X } from "constants/layout";
import { Button, Tab, Tabs, Typography } from "@mui/material";
import { IoMdRefresh } from "react-icons/io";
import { CiscoList } from "ui/cisco";
import { ICisco } from "interfaces";
import { db } from "server";

const CiscoPage: NextPage<{
  data: ICisco[];
}> = ({ data }): React.ReactElement => {
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
        </div>
        <div className={`bg-white min-h-screen ${PADDING_X}`}>
          <div className="py-5">
            {tabNumber === 0 ? (
              <CiscoList data={data} />
            ) : tabNumber === 1 ? (
              <CiscoList data={[...data.filter((it) => it.impact.includes("Medium"))]} />
            ) : tabNumber === 2 ? (
              <CiscoList data={[...data.filter((it) => it.impact.includes("High"))]} />
            ) : tabNumber === 3 ? (
              <CiscoList data={[...data.filter((it) => it.impact.includes("Critical"))]} />
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
      data: await db.cisco.findMany(),
    },
  };
};

export default CiscoPage;
