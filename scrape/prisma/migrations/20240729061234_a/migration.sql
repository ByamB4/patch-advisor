/*
  Warnings:

  - You are about to drop the column `documentId` on the `Redhat` table. All the data in the column will be lost.
  - You are about to drop the column `productTreeId` on the `Redhat` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[redhatId]` on the table `Document` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[redhatId]` on the table `ProductTree` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Redhat" DROP CONSTRAINT "Redhat_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat" DROP CONSTRAINT "Redhat_productTreeId_fkey";

-- AlterTable
ALTER TABLE "Document" ADD COLUMN     "redhatId" TEXT;

-- AlterTable
ALTER TABLE "ProductTree" ADD COLUMN     "redhatId" TEXT;

-- AlterTable
ALTER TABLE "Redhat" DROP COLUMN "documentId",
DROP COLUMN "productTreeId";

-- CreateIndex
CREATE UNIQUE INDEX "Document_redhatId_key" ON "Document"("redhatId");

-- CreateIndex
CREATE UNIQUE INDEX "ProductTree_redhatId_key" ON "ProductTree"("redhatId");

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("RHSA") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductTree" ADD CONSTRAINT "ProductTree_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("RHSA") ON DELETE SET NULL ON UPDATE CASCADE;
