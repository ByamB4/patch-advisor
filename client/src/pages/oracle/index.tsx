import { MainLayout } from "@/layouts";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { ORACLE_TABS, MARGIN_Y, PADDING_X } from "@/constants/configs";
import { useState } from "react";
import { Button, Tab, Tabs, Typography } from "@mui/material";
import { IoMdRefresh } from "react-icons/io";
import { OracleList } from "@/ui/oracle";
import { IOracle } from "@/interfaces";
import { db } from "@/server";

const OraclePage: NextPage<{
  data: IOracle[];
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
                {ORACLE_TABS.map((it, _: number) => (
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
          <div className="py-5">{tabNumber === 0 ? <OracleList data={data} /> : <></>}</div>
        </div>
      </div>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  return {
    props: {
      data: await db.oracle.findMany(),
    },
  };
};

export default OraclePage;
