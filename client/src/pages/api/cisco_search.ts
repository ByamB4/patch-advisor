import { db } from "@/server";
import { NextApiRequest, NextApiResponse } from "next";

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const { search } = req.query;
  const data = await db.cisco.findMany({
    orderBy: {
      lastUpdated: "desc",
    },
    where: {
      OR: [
        {
          advisoryTitle: {
            contains: search as string,
            mode: "insensitive",
          },
        },
        {
          document: {
            title: {
              contains: search as string,
              mode: "insensitive",
            },
          },
        },
        {
          vulnerabilities: {
            every: {
              cve: {
                contains: search as string,
                mode: "insensitive",
              },
            },
          },
        },
      ],
    },
    // initialData: await db.cisco.findMany({
    //   orderBy: {
    //     lastUpdated: "desc",
    //   },
    // }),
    include: {
      document: {
        select: {
          title: true,
          notes: true,
          tracking: {
            select: {
              current_release_date: true,
            },
          },
        },
      },
    },
  });

  res.status(200).json(data);
}
