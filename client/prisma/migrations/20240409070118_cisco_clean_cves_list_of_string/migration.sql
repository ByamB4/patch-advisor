/*
  Warnings:

  - The `clean_cves` column on the `cisco` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "cisco" DROP COLUMN "clean_cves",
ADD COLUMN     "clean_cves" TEXT[];
