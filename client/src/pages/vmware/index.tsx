import { MainLayout } from "@/layouts";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import { useState } from "react";
import { Button, Tab, Tabs, Typography } from "@mui/material";
import { IoMdRefresh } from "react-icons/io";
import { VMWARE_TABS, MARGIN_Y, PADDING_X } from "@/constants/configs";
import { VMwareList } from "@/ui/vmware";
import { IVmware } from "@/interfaces";
import VmwareList from "@/ui/vmware/list";
import { db } from "@/server";

const VMWare: NextPage<{
  data: IVmware[];
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
                {VMWARE_TABS.map((it, _: number) => (
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
              <VMwareList data={data} />
            ) : tabNumber === 1 ? (
              <VMwareList data={[...data.filter((it) => it.severity === "moderate")]} />
            ) : tabNumber === 2 ? (
              <VMwareList data={[...data.filter((it) => it.severity === "critical")]} />
            ) : tabNumber === 3 ? (
              <VmwareList data={[...data.filter((it) => it.severity === "important")]} />
            ) : tabNumber === 4 ? (
              <VmwareList data={[...data.filter((it) => it.severity === "low")]} />
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
      data: await db.vmware.findMany(),
    },
  };
};

export default VMWare;
