/*
  Warnings:

  - The primary key for the `Redhat` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[id]` on the table `Redhat` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Acknowledgment` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_AggregateSeverity` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Branch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Branch2` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Branch3` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_CvssV3` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Cwe` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Distribution` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Document` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Engine` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Generator` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Id` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Note` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Note2` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Product` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_ProductIdentificationHelper` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_ProductStatus` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_ProductTree` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Publisher` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Reference` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Reference2` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Remediation` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_RestartRequired` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_RevisionHistory` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Score` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Threat` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Tlp` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Tracking` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Redhat_Vulnerability` will be added. If there are existing duplicate values, this will fail.
  - The required column `id` was added to the `Redhat` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Document" DROP CONSTRAINT "Redhat_Document_redhatId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_ProductTree" DROP CONSTRAINT "Redhat_ProductTree_redhatId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability" DROP CONSTRAINT "Redhat_Vulnerability_redhatRHSA_fkey";

-- AlterTable
ALTER TABLE "Redhat" DROP CONSTRAINT "Redhat_pkey",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "Redhat_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_id_key" ON "Redhat"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Acknowledgment_id_key" ON "Redhat_Acknowledgment"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_AggregateSeverity_id_key" ON "Redhat_AggregateSeverity"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Branch_id_key" ON "Redhat_Branch"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Branch2_id_key" ON "Redhat_Branch2"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Branch3_id_key" ON "Redhat_Branch3"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_CvssV3_id_key" ON "Redhat_CvssV3"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Cwe_id_key" ON "Redhat_Cwe"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Distribution_id_key" ON "Redhat_Distribution"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_id_key" ON "Redhat_Document"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Engine_id_key" ON "Redhat_Engine"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Generator_id_key" ON "Redhat_Generator"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Id_id_key" ON "Redhat_Id"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Note_id_key" ON "Redhat_Note"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Note2_id_key" ON "Redhat_Note2"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Product_id_key" ON "Redhat_Product"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_ProductIdentificationHelper_id_key" ON "Redhat_ProductIdentificationHelper"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_ProductStatus_id_key" ON "Redhat_ProductStatus"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_ProductTree_id_key" ON "Redhat_ProductTree"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Publisher_id_key" ON "Redhat_Publisher"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Reference_id_key" ON "Redhat_Reference"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Reference2_id_key" ON "Redhat_Reference2"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Remediation_id_key" ON "Redhat_Remediation"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_RestartRequired_id_key" ON "Redhat_RestartRequired"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_RevisionHistory_id_key" ON "Redhat_RevisionHistory"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Score_id_key" ON "Redhat_Score"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Threat_id_key" ON "Redhat_Threat"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Tlp_id_key" ON "Redhat_Tlp"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Tracking_id_key" ON "Redhat_Tracking"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_id_key" ON "Redhat_Vulnerability"("id");

-- AddForeignKey
ALTER TABLE "Redhat_Document" ADD CONSTRAINT "Redhat_Document_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_ProductTree" ADD CONSTRAINT "Redhat_ProductTree_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability" ADD CONSTRAINT "Redhat_Vulnerability_redhatRHSA_fkey" FOREIGN KEY ("redhatRHSA") REFERENCES "Redhat"("id") ON DELETE SET NULL ON UPDATE CASCADE;
