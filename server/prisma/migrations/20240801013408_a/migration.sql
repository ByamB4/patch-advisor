/*
  Warnings:

  - Added the required column `cvssBaseScore` to the `Cisco` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Cisco" ADD COLUMN     "cvssBaseScore" TEXT NOT NULL;
