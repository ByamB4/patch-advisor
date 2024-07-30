/*
  Warnings:

  - A unique constraint covering the columns `[vulnerabilityId]` on the table `Redhat_Vulnerability_Cwe` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability" DROP CONSTRAINT "Redhat_Vulnerability_cweId_fkey";

-- AlterTable
ALTER TABLE "Redhat_Vulnerability" ALTER COLUMN "productStatusId" DROP NOT NULL,
ALTER COLUMN "cweId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Redhat_Vulnerability_Cwe" ADD COLUMN     "vulnerabilityId" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Cwe_vulnerabilityId_key" ON "Redhat_Vulnerability_Cwe"("vulnerabilityId");

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Cwe" ADD CONSTRAINT "Redhat_Vulnerability_Cwe_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;
