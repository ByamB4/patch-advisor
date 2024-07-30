/*
  Warnings:

  - A unique constraint covering the columns `[documentId]` on the table `AggregateSeverity` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[distributionId]` on the table `Tlp` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Distribution" DROP CONSTRAINT "Distribution_tlpId_fkey";

-- DropForeignKey
ALTER TABLE "Document" DROP CONSTRAINT "Document_aggregateSeverityId_fkey";

-- AlterTable
ALTER TABLE "AggregateSeverity" ADD COLUMN     "documentId" TEXT;

-- AlterTable
ALTER TABLE "Tlp" ADD COLUMN     "distributionId" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "AggregateSeverity_documentId_key" ON "AggregateSeverity"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "Tlp_distributionId_key" ON "Tlp"("distributionId");

-- AddForeignKey
ALTER TABLE "AggregateSeverity" ADD CONSTRAINT "AggregateSeverity_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Document"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tlp" ADD CONSTRAINT "Tlp_distributionId_fkey" FOREIGN KEY ("distributionId") REFERENCES "Distribution"("id") ON DELETE SET NULL ON UPDATE CASCADE;
