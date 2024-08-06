import { MainLayout } from "@/layouts";
import { NextPage } from "next";

const LandingPage: NextPage<unknown> = (): React.ReactElement => {
  return (
    <MainLayout>
      <div className="flex justify-center">
        <img src="DigipayKBBanner.png" className="flex rounded-xl" alt="digipay-logo" />
      </div>
    </MainLayout>
  );
};

export default LandingPage;
