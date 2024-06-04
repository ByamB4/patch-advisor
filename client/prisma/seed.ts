import { PrismaClient } from "@prisma/client";
import * as fs from "fs";
import * as path from "path";
import { ICisco, IOracle, IRedhat, IVmware } from "interfaces";

const prisma = new PrismaClient();

function readJsonFile(filePath: string) {
  try {
    const jsonString = fs.readFileSync(filePath, "utf-8");
    const data = JSON.parse(jsonString);
    return data;
  } catch (err) {
    console.log("Error reading JSON file: ", err);
    return [];
  }
}

async function insertRedhat(filePath: string) {
  const items: IRedhat[] = readJsonFile(filePath);
  await prisma.redhat.createMany({
    data: items,
    skipDuplicates: true,
  });
  console.log("[seed@redhat] done");
}
async function insertVmware(filePath: string) {
  const items: IVmware[] = readJsonFile(filePath);
  await prisma.vmware.createMany({
    data: items,
    skipDuplicates: true,
  });
  console.log("[seed@vmware] done");
}
async function insertCisco(filePath: string) {
  const items: ICisco[] = readJsonFile(filePath);
  await prisma.cisco.createMany({
    data: items,
    skipDuplicates: true,
  });
  console.log("[seed@cisco] done");
}

async function insertOracle(filePath: string) {
  const items: IOracle[] = readJsonFile(filePath);
  await prisma.oracle.createMany({
    data: items,
    skipDuplicates: true,
  });
  console.log("[seed@oracle] done");
}

async function main() {
  const parentDir = path.resolve(__dirname, "..");
  const _static = path.resolve(parentDir, "scrape/static");
  insertRedhat(`${_static}/redhat.json`);
  insertVmware(`${_static}/vmware.json`);
  insertCisco(`${_static}/cisco.json`);
  insertOracle(`${_static}/oracle.json`);
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
