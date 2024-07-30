/*
  Warnings:

  - You are about to drop the column `cvssV3Id` on the `Redhat_Vulnerability_Score` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[scoreId]` on the table `Redhat_Vulnerability_CvssV3` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Score" DROP CONSTRAINT "Redhat_Vulnerability_Score_cvssV3Id_fkey";

-- AlterTable
ALTER TABLE "Redhat_Vulnerability_CvssV3" ADD COLUMN     "scoreId" TEXT;

-- AlterTable
ALTER TABLE "Redhat_Vulnerability_Score" DROP COLUMN "cvssV3Id";

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_CvssV3_scoreId_key" ON "Redhat_Vulnerability_CvssV3"("scoreId");

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_CvssV3" ADD CONSTRAINT "Redhat_Vulnerability_CvssV3_scoreId_fkey" FOREIGN KEY ("scoreId") REFERENCES "Redhat_Vulnerability_Score"("id") ON DELETE SET NULL ON UPDATE CASCADE;
