import { db } from "@/server";
import { NextApiRequest, NextApiResponse } from "next";

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const { search } = req.query;
  const data = await db.redhat.findMany({
    where: {
      OR: [
        {
          RHSA: {
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
          aggregate_severity: {
            select: {
              text: true,
            },
          },
        },
      },
    },
  });

  res.status(200).json(data);
}
