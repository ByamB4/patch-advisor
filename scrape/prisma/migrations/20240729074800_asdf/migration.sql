/*
  Warnings:

  - You are about to drop the `Redhat_Note` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Note2` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Note" DROP CONSTRAINT "Redhat_Note_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Note2" DROP CONSTRAINT "Redhat_Note2_vulnerabilityId_fkey";

-- DropTable
DROP TABLE "Redhat_Note";

-- DropTable
DROP TABLE "Redhat_Note2";

-- CreateTable
CREATE TABLE "Redhat_Document_Note" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Document_Note_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Note" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_Note_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Note_id_key" ON "Redhat_Document_Note"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Note_id_key" ON "Redhat_Vulnerability_Note"("id");

-- AddForeignKey
ALTER TABLE "Redhat_Document_Note" ADD CONSTRAINT "Redhat_Document_Note_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Note" ADD CONSTRAINT "Redhat_Vulnerability_Note_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;
