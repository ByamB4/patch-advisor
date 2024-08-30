import { db } from "@/server";
import { NextApiRequest, NextApiResponse } from "next";

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const { search } = req.query;
  const data = await db.microsoft.findMany({
    orderBy: {
      release_date: "desc",
    },
    where: {
      OR: [
        {
          cve: {
            contains: search as string,
            mode: "insensitive",
          },
        },
        {
          cve_title: {
            contains: search as string,
            mode: "insensitive",
          },
        },
      ],
    },
  });

  res.status(200).json(data);
}
