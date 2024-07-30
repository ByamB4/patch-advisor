/*
  Warnings:

  - A unique constraint covering the columns `[vulnerabilityId]` on the table `Redhat_ProductStatus` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability" DROP CONSTRAINT "Redhat_Vulnerability_productStatusId_fkey";

-- AlterTable
ALTER TABLE "Redhat_ProductStatus" ADD COLUMN     "vulnerabilityId" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_ProductStatus_vulnerabilityId_key" ON "Redhat_ProductStatus"("vulnerabilityId");

-- AddForeignKey
ALTER TABLE "Redhat_ProductStatus" ADD CONSTRAINT "Redhat_ProductStatus_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;
