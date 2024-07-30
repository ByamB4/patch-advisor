/*
  Warnings:

  - You are about to drop the `Redhat_Acknowledgment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Cwe` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_ProductStatus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Remediation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Score` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_Threat` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Redhat_Acknowledgment" DROP CONSTRAINT "Redhat_Acknowledgment_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_ProductStatus" DROP CONSTRAINT "Redhat_ProductStatus_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Remediation" DROP CONSTRAINT "Redhat_Remediation_restartRequiredId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Remediation" DROP CONSTRAINT "Redhat_Remediation_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Score" DROP CONSTRAINT "Redhat_Score_cvssV3Id_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Score" DROP CONSTRAINT "Redhat_Score_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Threat" DROP CONSTRAINT "Redhat_Threat_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability" DROP CONSTRAINT "Redhat_Vulnerability_cweId_fkey";

-- DropTable
DROP TABLE "Redhat_Acknowledgment";

-- DropTable
DROP TABLE "Redhat_Cwe";

-- DropTable
DROP TABLE "Redhat_ProductStatus";

-- DropTable
DROP TABLE "Redhat_Remediation";

-- DropTable
DROP TABLE "Redhat_Score";

-- DropTable
DROP TABLE "Redhat_Threat";

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_ProductStatus" (
    "id" TEXT NOT NULL,
    "fixed" TEXT[],
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_ProductStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Remediation" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "product_ids" TEXT[],
    "url" TEXT NOT NULL,
    "vulnerabilityId" TEXT,
    "restartRequiredId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Vulnerability_Remediation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Score" (
    "id" TEXT NOT NULL,
    "products" TEXT[],
    "vulnerabilityId" TEXT,
    "cvssV3Id" TEXT NOT NULL,

    CONSTRAINT "Redhat_Vulnerability_Score_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Threat" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_Threat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Cwe" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Redhat_Vulnerability_Cwe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Acknowledgment" (
    "id" TEXT NOT NULL,
    "names" TEXT[],
    "organization" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_Acknowledgment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_ProductStatus_id_key" ON "Redhat_Vulnerability_ProductStatus"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_ProductStatus_vulnerabilityId_key" ON "Redhat_Vulnerability_ProductStatus"("vulnerabilityId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Remediation_id_key" ON "Redhat_Vulnerability_Remediation"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Score_id_key" ON "Redhat_Vulnerability_Score"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Threat_id_key" ON "Redhat_Vulnerability_Threat"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Cwe_id_key" ON "Redhat_Vulnerability_Cwe"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Acknowledgment_id_key" ON "Redhat_Vulnerability_Acknowledgment"("id");

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability" ADD CONSTRAINT "Redhat_Vulnerability_cweId_fkey" FOREIGN KEY ("cweId") REFERENCES "Redhat_Vulnerability_Cwe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_ProductStatus" ADD CONSTRAINT "Redhat_Vulnerability_ProductStatus_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Remediation" ADD CONSTRAINT "Redhat_Vulnerability_Remediation_restartRequiredId_fkey" FOREIGN KEY ("restartRequiredId") REFERENCES "Redhat_RestartRequired"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Remediation" ADD CONSTRAINT "Redhat_Vulnerability_Remediation_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Score" ADD CONSTRAINT "Redhat_Vulnerability_Score_cvssV3Id_fkey" FOREIGN KEY ("cvssV3Id") REFERENCES "Redhat_CvssV3"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Score" ADD CONSTRAINT "Redhat_Vulnerability_Score_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Threat" ADD CONSTRAINT "Redhat_Vulnerability_Threat_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Acknowledgment" ADD CONSTRAINT "Redhat_Vulnerability_Acknowledgment_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;
