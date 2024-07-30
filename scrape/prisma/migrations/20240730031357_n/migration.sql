/*
  Warnings:

  - You are about to drop the `Redhat_Vulnerability_Acknowledgment` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Acknowledgment" DROP CONSTRAINT "Redhat_Vulnerability_Acknowledgment_vulnerabilityId_fkey";

-- DropTable
DROP TABLE "Redhat_Vulnerability_Acknowledgment";
