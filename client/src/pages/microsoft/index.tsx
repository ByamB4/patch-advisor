import { MainLayout } from "layouts";
import { NextPage } from "next";
import { REDHAT_TABS } from "constants/configs";
import { useEffect, useState } from "react";
import { MARGIN_Y, PADDING_X } from "constants/layout";
import { Button, Tab, Tabs, Typography } from "@mui/material";
import { IoMdRefresh } from "react-icons/io";
import { GetServerSideProps, GetServerSidePropsResult } from "next";
import { IVulnerability } from "interfaces";
import axios from "axios";
import MicrosoftUI from "ui/microsoft/list";

interface Props {
  className?: string;
  data: IVulnerability[];
}

interface IItem {
  ID: string;
  Alias: string;
  DocumentTitle: string;
  Severity: null;
  InitialReleaseDate: string;
  CurrentReleaseDate: string;
}

const MicrosoftPage: NextPage<Props> = ({ className = "", data = [] }): React.ReactElement => {
  const [tabNumber, setTabNumber] = useState<number>(0);
  useEffect(() => {
    console.log(data);
  }, []);

  return (
    <MainLayout NO_PADDING>
      <div className={`${MARGIN_Y} ${className}`}>
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
        </div>
        <div className={`bg-white min-h-screen ${PADDING_X}`}>
          <div className="py-5">{tabNumber === 0 ? <MicrosoftUI data={data} /> : <></>}</div>
        </div>
      </div>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (context): Promise<GetServerSidePropsResult<any>> => {
  try {
    const customSort = (items: IItem[]) => {
      const monthMap: { [key: string]: number } = {
        Jan: 1,
        Feb: 2,
        Mar: 3,
        Apr: 4,
        May: 5,
        Jun: 6,
        Jul: 7,
        Aug: 8,
        Sep: 9,
        Oct: 10,
        Nov: 11,
        Dec: 12,
      };
      return items.sort((a, b) => {
        const datePartsA: string[] = a.ID.split("-");
        const dateA = new Date(parseInt(datePartsA[0]), monthMap[datePartsA[1].charAt(0).toUpperCase() + datePartsA[1].slice(1)] - 1, 1).getTime();

        const datePartsB: string[] = b.ID.split("-");
        const dateB = new Date(parseInt(datePartsB[0]), monthMap[datePartsB[1].charAt(0).toUpperCase() + datePartsB[1].slice(1)] - 1, 1).getTime();

        return dateA - dateB;
      });
    };

    const last_updates = await axios
      .get("https://api.msrc.microsoft.com/cvrf/v3.0/updates", {
        responseType: "json",
      })
      .then((data) => {
        return data;
      });

    const sortedItems: IItem[] = customSort(last_updates.data["value"]);
    const lastItem: IItem = sortedItems[sortedItems.length - 1];
    console.log(`https://api.msrc.microsoft.com/cvrf/v3.0/cvrf/${lastItem["ID"]}`);
    const current_month = await axios
      .get(`https://api.msrc.microsoft.com/cvrf/v3.0/cvrf/${lastItem["ID"]}`, {
        headers: {
          Accept: "application/json",
        },
        responseType: "json",
      })
      .then((data) => {
        return data;
      });

    return {
      props: {
        success: true,
        data: current_month.data.Vulnerability,
      },
    };
  } catch (e) {
    return {
      props: {
        success: false,
        data: {},
      },
    };
  }
};

export default MicrosoftPage;
