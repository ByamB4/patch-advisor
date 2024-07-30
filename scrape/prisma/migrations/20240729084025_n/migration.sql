/*
  Warnings:

  - You are about to drop the column `trackingId` on the `Redhat_Document` table. All the data in the column will be lost.
  - You are about to drop the `Redhat_Engine` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Generator` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_RevisionHistory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Tracking` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Document" DROP CONSTRAINT "Redhat_Document_trackingId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Generator" DROP CONSTRAINT "Redhat_Generator_engineId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_RevisionHistory" DROP CONSTRAINT "Redhat_RevisionHistory_trackingId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Tracking" DROP CONSTRAINT "Redhat_Tracking_generatorId_fkey";

-- AlterTable
ALTER TABLE "Redhat_Document" DROP COLUMN "trackingId";

-- DropTable
DROP TABLE "Redhat_Engine";

-- DropTable
DROP TABLE "Redhat_Generator";

-- DropTable
DROP TABLE "Redhat_RevisionHistory";

-- DropTable
DROP TABLE "Redhat_Tracking";
