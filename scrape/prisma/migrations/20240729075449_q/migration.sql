/*
  Warnings:

  - A unique constraint covering the columns `[documentId]` on the table `Redhat_Publisher` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Document" DROP CONSTRAINT "Redhat_Document_publisherId_fkey";

-- AlterTable
ALTER TABLE "Redhat_Publisher" ADD COLUMN     "documentId" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Publisher_documentId_key" ON "Redhat_Publisher"("documentId");

-- AddForeignKey
ALTER TABLE "Redhat_Publisher" ADD CONSTRAINT "Redhat_Publisher_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE SET NULL ON UPDATE CASCADE;
