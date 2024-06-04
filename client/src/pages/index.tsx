import { MainLayout } from "layouts";
import { NextPage } from "next";

const LandingPage: NextPage<unknown> = (): React.ReactElement => {
  return (
    <MainLayout>
      <div className="flex justify-center">
        <h1 className="text-[50px]">MAYBE DRAW DASHBOARD HERE</h1>
      </div>
    </MainLayout>
  );
};

export default LandingPage;
