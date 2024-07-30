/*
  Warnings:

  - You are about to drop the column `cweId` on the `Redhat_Vulnerability` table. All the data in the column will be lost.
  - You are about to drop the column `productStatusId` on the `Redhat_Vulnerability` table. All the data in the column will be lost.
  - You are about to drop the column `redhatRHSA` on the `Redhat_Vulnerability` table. All the data in the column will be lost.
  - You are about to drop the column `restartRequiredId` on the `Redhat_Vulnerability_Remediation` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability" DROP CONSTRAINT "Redhat_Vulnerability_redhatRHSA_fkey";

-- AlterTable
ALTER TABLE "Redhat_Vulnerability" DROP COLUMN "cweId",
DROP COLUMN "productStatusId",
DROP COLUMN "redhatRHSA",
ADD COLUMN     "redhatId" TEXT;

-- AlterTable
ALTER TABLE "Redhat_Vulnerability_Remediation" DROP COLUMN "restartRequiredId";

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability" ADD CONSTRAINT "Redhat_Vulnerability_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("id") ON DELETE SET NULL ON UPDATE CASCADE;
