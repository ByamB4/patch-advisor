/*
  Warnings:

  - You are about to drop the `Redhat_Branch` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Branch2` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Branch3` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Id` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_ProductIdentificationHelper` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_ProductTree` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Branch" DROP CONSTRAINT "Redhat_Branch_productTreeId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Branch2" DROP CONSTRAINT "Redhat_Branch2_branchId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Branch3" DROP CONSTRAINT "Redhat_Branch3_branch2Id_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Branch3" DROP CONSTRAINT "Redhat_Branch3_productId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Id" DROP CONSTRAINT "Redhat_Id_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Product" DROP CONSTRAINT "Redhat_Product_productIdentificationHelperId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_ProductTree" DROP CONSTRAINT "Redhat_ProductTree_redhatId_fkey";

-- DropTable
DROP TABLE "Redhat_Branch";

-- DropTable
DROP TABLE "Redhat_Branch2";

-- DropTable
DROP TABLE "Redhat_Branch3";

-- DropTable
DROP TABLE "Redhat_Id";

-- DropTable
DROP TABLE "Redhat_Product";

-- DropTable
DROP TABLE "Redhat_ProductIdentificationHelper";

-- DropTable
DROP TABLE "Redhat_ProductTree";

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Id" (
    "id" TEXT NOT NULL,
    "system_name" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_Id_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Id_id_key" ON "Redhat_Vulnerability_Id"("id");

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Id" ADD CONSTRAINT "Redhat_Vulnerability_Id_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;
