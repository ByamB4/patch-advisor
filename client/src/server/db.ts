import { PrismaClient } from "@prisma/client";
// import { withOptimize } from "@prisma/extension-optimize";

// export const db = new PrismaClient().$extends(withOptimize());
export const db = new PrismaClient();
