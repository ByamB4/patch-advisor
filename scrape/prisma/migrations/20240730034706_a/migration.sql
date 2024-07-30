/*
  Warnings:

  - Made the column `redhatId` on table `Redhat_Vulnerability` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX "Redhat_Vulnerability_redhatId_key";

-- AlterTable
ALTER TABLE "Redhat_Vulnerability" ALTER COLUMN "redhatId" SET NOT NULL;
