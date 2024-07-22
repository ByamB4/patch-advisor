import { Breadcrumbs, Link, Typography } from "@mui/material";
import { MdOutlineNavigateNext } from "react-icons/md";
import { MainLayout } from "@/layouts";
import { IVmware } from "@/interfaces";
import { useRouter } from "next/router";
import { GetServerSideProps, GetServerSidePropsResult, NextPage } from "next";
import styles from "styles/vmware.module.scss";
import { db } from "@/server";

const VmwareDetail: NextPage<{
  data: IVmware;
}> = ({ data }): React.ReactElement => {
  const router = useRouter();
  const breadcrumbs = [
    <Link underline="hover" key="1" color="primary" href="/vmware" onClick={() => router.push("/redhat")}>
      <span className="font-medium">VMware Security Advisories</span>
    </Link>,
    <Typography key="3" color="text.primary">
      {data.cve}
    </Typography>,
  ];

  return (
    <MainLayout>
      <main className="mx-24">
        <Breadcrumbs separator={<MdOutlineNavigateNext fontSize="small" />} aria-label="breadcrumb">
          {breadcrumbs}
        </Breadcrumbs>
        <div
          className={styles.customPage}
          dangerouslySetInnerHTML={{
            __html: data.detail,
          }}
        />
      </main>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  const cve = context?.params?.cve;

  if (typeof cve === "string") {
    return {
      props: {
        data: await db.vmware.findFirst({
          where: {
            cve: cve,
          },
        }),
        success: true,
      },
    };
  }
  return {
    props: {
      success: false,
      data: {},
    },
  };
};

export default VmwareDetail;
