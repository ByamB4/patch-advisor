/*
  Warnings:

  - You are about to drop the `Cisco_Vulnerabilities_Product_Notes` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Cisco_Vulnerabilities_Product_Notes" DROP CONSTRAINT "Cisco_Vulnerabilities_Product_Notes_ciscoVulnerabilitiesId_fkey";

-- DropTable
DROP TABLE "Cisco_Vulnerabilities_Product_Notes";

-- CreateTable
CREATE TABLE "Cisco_Vulnerabilities_Product_Status" (
    "id" TEXT NOT NULL,
    "known_affected" TEXT[],
    "ciscoVulnerabilitiesId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Vulnerabilities_Product_Status_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_Product_Status_id_key" ON "Cisco_Vulnerabilities_Product_Status"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_Product_Status_ciscoVulnerabilitiesId_key" ON "Cisco_Vulnerabilities_Product_Status"("ciscoVulnerabilitiesId");

-- AddForeignKey
ALTER TABLE "Cisco_Vulnerabilities_Product_Status" ADD CONSTRAINT "Cisco_Vulnerabilities_Product_Status_ciscoVulnerabilitiesI_fkey" FOREIGN KEY ("ciscoVulnerabilitiesId") REFERENCES "Cisco_Vulnerabilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;
