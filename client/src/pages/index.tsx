/* eslint-disable @next/next/no-img-element */
import { MainLayout } from "@/layouts";
import { IconButton, Typography } from "@mui/material";
import { NextPage } from "next";
import { Comfortaa } from "next/font/google";
import { FaPix } from "react-icons/fa6";
import { RxDashboard } from "react-icons/rx";
import { HiOutlineBell } from "react-icons/hi";
import { TbAnalyze } from "react-icons/tb";

const comfortaa = Comfortaa({ subsets: ["latin"] });

const LandingPage: NextPage<unknown> = (): React.ReactElement => {
  const hover_animation: string = "hover:scale-95 duration-500";

  return (
    <MainLayout className="bg-white">
      <section className="grid grid-cols-8 gap-8 flex-center justify-center">
        <div className="col-span-3 justify-center flex-center h-full">
          <div className={`flex flex-col gap-8 justify-center h-full`}>
            <div className={`flex flex-col font-semibold ${comfortaa.className}`}>
              <span className="text-[56px]">No-paper Rules</span>
              <span className="text-[56px]">Engine for</span>
              <span className="text-[56px]">Automated Patch</span>
            </div>
            <div>
              <span className="font-exo text-lg text-[#696974]">
                We moved from Excel reports to an automated patch scraper combined with a news platform, letting you access real-time updates whenever you need them
              </span>
            </div>
          </div>
        </div>
        <div
          className="flex gap-6 shadow-xl rounded-xl p-6 col-span-5"
          style={{
            backgroundImage: "radial-gradient(#9797A0 0.5px, #fff 0.5px)",
            backgroundSize: "13px 13px",
          }}
        >
          <div className="flex flex-col justify-between py-6 px-3 h-full bg-[#364670] rounded-xl">
            <div className="flex flex-col gap-8">
              <IconButton aria-label="dashboard" size="small">
                <RxDashboard size={24} className="text-white" />
              </IconButton>
              <IconButton aria-label="bell" size="small">
                <HiOutlineBell size={24} className="text-white" />
              </IconButton>
            </div>
            <IconButton aria-label="analyze" size="small">
              <TbAnalyze size={24} className="text-white" />
            </IconButton>
          </div>
          <div className="flex flex-col w-full gap-40 my-24">
            <section className="flex gap-32">
              <section className={`flex flex-col gap-6 border-2 border-[#364670] px-8 py-4 rounded-2xl bg-white ${hover_animation}`}>
                <div className="flex gap-2 items-center">
                  <FaPix className="text-white p-2 bg-[#3E4178] rounded-md" size={36} />
                  <Typography variant="h6" className="font-medium">
                    Fetch data using API
                  </Typography>
                </div>
                <div className="flex flex-col gap-4">
                  <div className="flex items-center">
                    <input id="default-checkbox" type="checkbox" value="" className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 ring-offset-gray-800 focus:ring-2" />
                    <label htmlFor="default-checkbox" className="ms-2 text-sm font-medium ">
                      Check if there is new update
                    </label>
                  </div>
                  <div className="flex items-center">
                    <input id="default-checkbox" type="checkbox" value="" className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 ring-offset-gray-800 focus:ring-2" />
                    <label htmlFor="default-checkbox" className="ms-2 text-sm font-medium ">
                      Fetch data
                    </label>
                  </div>
                </div>
              </section>
              {/* <div className="flex items-center">
                <div className={`h-2 w-52 border-dotted border-[#5C698B] border-t-2 animate-pulse`} />
              </div> */}
              <section className={`flex flex-col gap-6 border-2 border-[#364670] px-8 py-4 rounded-2xl bg-white mr-24 ${hover_animation}`}>
                <div className="flex gap-2 items-center">
                  <FaPix className="text-white p-2 bg-[#3E4178] rounded-md" size={36} />
                  <Typography variant="h6" className="font-medium">
                    Write data to database
                  </Typography>
                </div>
                <div className="flex flex-col gap-4">
                  <div className="flex items-center">
                    <input id="default-checkbox" type="checkbox" value="" className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 ring-offset-gray-800 focus:ring-2" />
                    <label htmlFor="default-checkbox" className="ms-2 text-sm font-medium ">
                      Clean raw data
                    </label>
                  </div>
                  <div className="flex items-center">
                    <input id="default-checkbox" type="checkbox" value="" className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 ring-offset-gray-800 focus:ring-2" />
                    <label htmlFor="default-checkbox" className="ms-2 text-sm font-medium ">
                      Using prisma client to append database
                    </label>
                  </div>
                </div>
              </section>
            </section>
            <section className="flex gap-32">
              <section className={`flex flex-col gap-6 border-2 border-[#364670] px-8 py-4 rounded-2xl bg-white mr-24 ${hover_animation}`}>
                <div className="flex gap-2 items-center">
                  <FaPix className="text-white p-2 bg-[#3E4178] rounded-md" size={36} />
                  <Typography variant="h6" className="font-medium">
                    Scrape data using headless browser
                  </Typography>
                </div>
                <div className="flex flex-col gap-4">
                  <div className="flex items-center">
                    <input id="default-checkbox" type="checkbox" value="" className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 ring-offset-gray-800 focus:ring-2" />
                    <label htmlFor="default-checkbox" className="ms-2 text-sm font-medium ">
                      Run from docker container (headless=True)
                    </label>
                  </div>
                  <div className="flex items-center">
                    <input id="default-checkbox" type="checkbox" value="" className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 ring-offset-gray-800 focus:ring-2" />
                    <label htmlFor="default-checkbox" className="ms-2 text-sm font-medium ">
                      Check if there is new update
                    </label>
                  </div>
                  <div className="flex items-center">
                    <input id="default-checkbox" type="checkbox" value="" className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 ring-offset-gray-800 focus:ring-2" />
                    <label htmlFor="default-checkbox" className="ms-2 text-sm font-medium ">
                      Scrape possible data
                    </label>
                  </div>
                </div>
              </section>
              <div>
                <section className={`flex flex-col gap-6 border-2 border-[#364670] px-8 py-4 rounded-2xl bg-white ${hover_animation}`}>
                  <div className="flex gap-2 items-center">
                    <FaPix className="text-white p-2 bg-[#3E4178] rounded-md" size={36} />
                    <Typography variant="h6" className="font-medium">
                      Front end application
                    </Typography>
                  </div>
                  <div className="flex flex-col gap-4">
                    <div className="flex items-center">
                      <input
                        id="default-checkbox"
                        type="checkbox"
                        value=""
                        className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 ring-offset-gray-800 focus:ring-2"
                      />
                      <label htmlFor="default-checkbox" className="ms-2 text-sm font-medium ">
                        Main framework is NextJS
                      </label>
                    </div>
                    <div className="flex items-center">
                      <input
                        id="default-checkbox"
                        type="checkbox"
                        value=""
                        className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300  rounded focus:ring-blue-500 ring-offset-gray-800 focus:ring-2"
                      />
                      <label htmlFor="default-checkbox" className="ms-2 text-sm font-medium ">
                        CRUD operation using Prisma client
                      </label>
                    </div>
                  </div>
                </section>
              </div>
            </section>
          </div>
        </div>
      </section>
    </MainLayout>
  );
};

export default LandingPage;
