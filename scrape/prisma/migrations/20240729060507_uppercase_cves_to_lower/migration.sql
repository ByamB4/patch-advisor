/*
  Warnings:

  - You are about to drop the column `CVES` on the `Redhat` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Redhat" DROP COLUMN "CVES",
ADD COLUMN     "CVEs" TEXT[];
