/*
  Warnings:

  - Added the required column `cweId` to the `Redhat_Vulnerability_Cwe` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Redhat_Vulnerability_Cwe" ADD COLUMN     "cweId" TEXT NOT NULL;
