/*
  Warnings:

  - Added the required column `revision_date` to the `microsoft` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "microsoft" ADD COLUMN     "revision_date" TEXT NOT NULL;
