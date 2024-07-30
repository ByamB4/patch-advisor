/*
  Warnings:

  - You are about to drop the `Redhat_Reference` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Reference2` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Reference" DROP CONSTRAINT "Redhat_Reference_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Reference2" DROP CONSTRAINT "Redhat_Reference2_vulnerabilityId_fkey";

-- DropTable
DROP TABLE "Redhat_Reference";

-- DropTable
DROP TABLE "Redhat_Reference2";

-- CreateTable
CREATE TABLE "Redhat_Document_Reference" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Document_Reference_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Reference" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_Reference_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Reference_id_key" ON "Redhat_Document_Reference"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Reference_id_key" ON "Redhat_Vulnerability_Reference"("id");

-- AddForeignKey
ALTER TABLE "Redhat_Document_Reference" ADD CONSTRAINT "Redhat_Document_Reference_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Reference" ADD CONSTRAINT "Redhat_Vulnerability_Reference_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;
