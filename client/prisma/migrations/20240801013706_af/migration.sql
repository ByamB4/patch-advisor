/*
  Warnings:

  - You are about to drop the `cisco` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "cisco";

-- CreateTable
CREATE TABLE "Cisco" (
    "advisoryId" TEXT NOT NULL,
    "advisoryTitle" TEXT NOT NULL,
    "bugIDs" TEXT[],
    "ipsSignatures" TEXT[],
    "cves" TEXT[],
    "cvrfUrl" TEXT NOT NULL,
    "csafUrl" TEXT NOT NULL,
    "cvssBaseScore" TEXT NOT NULL,
    "cwe" TEXT[],
    "firstPublished" TEXT NOT NULL,
    "lastUpdated" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "productNames" TEXT[],
    "publicationUrl" TEXT NOT NULL,
    "sir" TEXT NOT NULL,
    "summary" TEXT NOT NULL,

    CONSTRAINT "Cisco_pkey" PRIMARY KEY ("advisoryId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_advisoryId_key" ON "Cisco"("advisoryId");
