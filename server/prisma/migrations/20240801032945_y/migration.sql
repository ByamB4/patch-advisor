/*
  Warnings:

  - You are about to drop the `Cisco_Acknowledgments` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cisco_Note` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cisco_Publisher` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cisco_References` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cisco_Tracking` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cisco_Tracking_Generator` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cisco_Tracking_Generator_Engine` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cisco_Tracking_Revision_History` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Cisco_Acknowledgments" DROP CONSTRAINT "Cisco_Acknowledgments_ciscoDocumentId_fkey";

-- DropForeignKey
ALTER TABLE "Cisco_Note" DROP CONSTRAINT "Cisco_Note_ciscoDocumentId_fkey";

-- DropForeignKey
ALTER TABLE "Cisco_Publisher" DROP CONSTRAINT "Cisco_Publisher_ciscoDocumentId_fkey";

-- DropForeignKey
ALTER TABLE "Cisco_References" DROP CONSTRAINT "Cisco_References_ciscoDocumentId_fkey";

-- DropForeignKey
ALTER TABLE "Cisco_Tracking" DROP CONSTRAINT "Cisco_Tracking_ciscoDocumentId_fkey";

-- DropForeignKey
ALTER TABLE "Cisco_Tracking_Generator" DROP CONSTRAINT "Cisco_Tracking_Generator_ciscoTrackingId_fkey";

-- DropForeignKey
ALTER TABLE "Cisco_Tracking_Generator_Engine" DROP CONSTRAINT "Cisco_Tracking_Generator_Engine_ciscoTrackingGeneratorId_fkey";

-- DropForeignKey
ALTER TABLE "Cisco_Tracking_Revision_History" DROP CONSTRAINT "Cisco_Tracking_Revision_History_ciscoTrackingId_fkey";

-- DropTable
DROP TABLE "Cisco_Acknowledgments";

-- DropTable
DROP TABLE "Cisco_Note";

-- DropTable
DROP TABLE "Cisco_Publisher";

-- DropTable
DROP TABLE "Cisco_References";

-- DropTable
DROP TABLE "Cisco_Tracking";

-- DropTable
DROP TABLE "Cisco_Tracking_Generator";

-- DropTable
DROP TABLE "Cisco_Tracking_Generator_Engine";

-- DropTable
DROP TABLE "Cisco_Tracking_Revision_History";

-- CreateTable
CREATE TABLE "Cisco_Document_Acknowledgments" (
    "id" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "ciscoDocumentId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Acknowledgments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Note" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "ciscoDocumentId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Note_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Publisher" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "contact_details" TEXT NOT NULL,
    "issuing_authority" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,
    "ciscoDocumentId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Publisher_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_References" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "ciscoDocumentId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_References_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Tracking" (
    "id" TEXT NOT NULL,
    "current_release_date" TEXT NOT NULL,
    "initial_release_date" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "ciscoDocumentId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Tracking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Tracking_Generator" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "ciscoTrackingId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Tracking_Generator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Tracking_Generator_Engine" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "ciscoTrackingGeneratorId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Tracking_Generator_Engine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Tracking_Revision_History" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "ciscoTrackingId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Tracking_Revision_History_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Acknowledgments_id_key" ON "Cisco_Document_Acknowledgments"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Note_id_key" ON "Cisco_Document_Note"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Publisher_id_key" ON "Cisco_Document_Publisher"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Publisher_ciscoDocumentId_key" ON "Cisco_Document_Publisher"("ciscoDocumentId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_References_id_key" ON "Cisco_Document_References"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_References_ciscoDocumentId_key" ON "Cisco_Document_References"("ciscoDocumentId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_id_key" ON "Cisco_Document_Tracking"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_ciscoDocumentId_key" ON "Cisco_Document_Tracking"("ciscoDocumentId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Generator_id_key" ON "Cisco_Document_Tracking_Generator"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Generator_ciscoTrackingId_key" ON "Cisco_Document_Tracking_Generator"("ciscoTrackingId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Generator_Engine_id_key" ON "Cisco_Document_Tracking_Generator_Engine"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Generator_Engine_ciscoTrackingGener_key" ON "Cisco_Document_Tracking_Generator_Engine"("ciscoTrackingGeneratorId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Revision_History_id_key" ON "Cisco_Document_Tracking_Revision_History"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Revision_History_ciscoTrackingId_key" ON "Cisco_Document_Tracking_Revision_History"("ciscoTrackingId");

-- AddForeignKey
ALTER TABLE "Cisco_Document_Acknowledgments" ADD CONSTRAINT "Cisco_Document_Acknowledgments_ciscoDocumentId_fkey" FOREIGN KEY ("ciscoDocumentId") REFERENCES "Cisco_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Note" ADD CONSTRAINT "Cisco_Document_Note_ciscoDocumentId_fkey" FOREIGN KEY ("ciscoDocumentId") REFERENCES "Cisco_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Publisher" ADD CONSTRAINT "Cisco_Document_Publisher_ciscoDocumentId_fkey" FOREIGN KEY ("ciscoDocumentId") REFERENCES "Cisco_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_References" ADD CONSTRAINT "Cisco_Document_References_ciscoDocumentId_fkey" FOREIGN KEY ("ciscoDocumentId") REFERENCES "Cisco_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Tracking" ADD CONSTRAINT "Cisco_Document_Tracking_ciscoDocumentId_fkey" FOREIGN KEY ("ciscoDocumentId") REFERENCES "Cisco_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Tracking_Generator" ADD CONSTRAINT "Cisco_Document_Tracking_Generator_ciscoTrackingId_fkey" FOREIGN KEY ("ciscoTrackingId") REFERENCES "Cisco_Document_Tracking"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Tracking_Generator_Engine" ADD CONSTRAINT "Cisco_Document_Tracking_Generator_Engine_ciscoTrackingGene_fkey" FOREIGN KEY ("ciscoTrackingGeneratorId") REFERENCES "Cisco_Document_Tracking_Generator"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Tracking_Revision_History" ADD CONSTRAINT "Cisco_Document_Tracking_Revision_History_ciscoTrackingId_fkey" FOREIGN KEY ("ciscoTrackingId") REFERENCES "Cisco_Document_Tracking"("id") ON DELETE CASCADE ON UPDATE CASCADE;
