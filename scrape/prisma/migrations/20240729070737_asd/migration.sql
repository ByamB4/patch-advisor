/*
  Warnings:

  - You are about to drop the `RedhatAcknowledgment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatAggregateSeverity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatBranch` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatBranch2` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatBranch3` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatCvssV3` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatCwe` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatDistribution` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatDocument` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatEngine` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatGenerator` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatId` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatNote` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatNote2` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatProduct` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatProductIdentificationHelper` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatProductStatus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatProductTree` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatPublisher` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatReference` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatReference2` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatRemediation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatRestartRequired` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatRevisionHistory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatScore` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatThreat` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatTlp` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatTracking` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedhatVulnerability` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "RedhatAcknowledgment" DROP CONSTRAINT "RedhatAcknowledgment_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatAggregateSeverity" DROP CONSTRAINT "RedhatAggregateSeverity_documentId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatBranch" DROP CONSTRAINT "RedhatBranch_productTreeId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatBranch2" DROP CONSTRAINT "RedhatBranch2_branchId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatBranch3" DROP CONSTRAINT "RedhatBranch3_branch2Id_fkey";

-- DropForeignKey
ALTER TABLE "RedhatBranch3" DROP CONSTRAINT "RedhatBranch3_productId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatDistribution" DROP CONSTRAINT "RedhatDistribution_documentId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatDocument" DROP CONSTRAINT "RedhatDocument_publisherId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatDocument" DROP CONSTRAINT "RedhatDocument_redhatId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatDocument" DROP CONSTRAINT "RedhatDocument_trackingId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatGenerator" DROP CONSTRAINT "RedhatGenerator_engineId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatId" DROP CONSTRAINT "RedhatId_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatNote" DROP CONSTRAINT "RedhatNote_documentId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatNote2" DROP CONSTRAINT "RedhatNote2_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatProduct" DROP CONSTRAINT "RedhatProduct_productIdentificationHelperId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatProductTree" DROP CONSTRAINT "RedhatProductTree_redhatId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatReference" DROP CONSTRAINT "RedhatReference_documentId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatReference2" DROP CONSTRAINT "RedhatReference2_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatRemediation" DROP CONSTRAINT "RedhatRemediation_restartRequiredId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatRemediation" DROP CONSTRAINT "RedhatRemediation_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatRevisionHistory" DROP CONSTRAINT "RedhatRevisionHistory_trackingId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatScore" DROP CONSTRAINT "RedhatScore_cvssV3Id_fkey";

-- DropForeignKey
ALTER TABLE "RedhatScore" DROP CONSTRAINT "RedhatScore_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatThreat" DROP CONSTRAINT "RedhatThreat_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatTlp" DROP CONSTRAINT "RedhatTlp_distributionId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatTracking" DROP CONSTRAINT "RedhatTracking_generatorId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatVulnerability" DROP CONSTRAINT "RedhatVulnerability_cweId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatVulnerability" DROP CONSTRAINT "RedhatVulnerability_productStatusId_fkey";

-- DropForeignKey
ALTER TABLE "RedhatVulnerability" DROP CONSTRAINT "RedhatVulnerability_redhatRHSA_fkey";

-- DropTable
DROP TABLE "RedhatAcknowledgment";

-- DropTable
DROP TABLE "RedhatAggregateSeverity";

-- DropTable
DROP TABLE "RedhatBranch";

-- DropTable
DROP TABLE "RedhatBranch2";

-- DropTable
DROP TABLE "RedhatBranch3";

-- DropTable
DROP TABLE "RedhatCvssV3";

-- DropTable
DROP TABLE "RedhatCwe";

-- DropTable
DROP TABLE "RedhatDistribution";

-- DropTable
DROP TABLE "RedhatDocument";

-- DropTable
DROP TABLE "RedhatEngine";

-- DropTable
DROP TABLE "RedhatGenerator";

-- DropTable
DROP TABLE "RedhatId";

-- DropTable
DROP TABLE "RedhatNote";

-- DropTable
DROP TABLE "RedhatNote2";

-- DropTable
DROP TABLE "RedhatProduct";

-- DropTable
DROP TABLE "RedhatProductIdentificationHelper";

-- DropTable
DROP TABLE "RedhatProductStatus";

-- DropTable
DROP TABLE "RedhatProductTree";

-- DropTable
DROP TABLE "RedhatPublisher";

-- DropTable
DROP TABLE "RedhatReference";

-- DropTable
DROP TABLE "RedhatReference2";

-- DropTable
DROP TABLE "RedhatRemediation";

-- DropTable
DROP TABLE "RedhatRestartRequired";

-- DropTable
DROP TABLE "RedhatRevisionHistory";

-- DropTable
DROP TABLE "RedhatScore";

-- DropTable
DROP TABLE "RedhatThreat";

-- DropTable
DROP TABLE "RedhatTlp";

-- DropTable
DROP TABLE "RedhatTracking";

-- DropTable
DROP TABLE "RedhatVulnerability";

-- CreateTable
CREATE TABLE "Redhat_Document" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "csaf_version" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "aggregateSeverityId" TEXT,
    "distributionId" TEXT,
    "publisherId" TEXT,
    "trackingId" TEXT,
    "redhatId" TEXT,

    CONSTRAINT "Redhat_Document_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_AggregateSeverity" (
    "id" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_AggregateSeverity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Distribution" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "documentId" TEXT,
    "tlpId" TEXT,

    CONSTRAINT "Redhat_Distribution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Tlp" (
    "id" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "distributionId" TEXT,

    CONSTRAINT "Redhat_Tlp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Note" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Note_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Publisher" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "contact_details" TEXT NOT NULL,
    "issuing_authority" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,

    CONSTRAINT "Redhat_Publisher_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Reference" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Reference_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Tracking" (
    "id" TEXT NOT NULL,
    "current_release_date" TEXT NOT NULL,
    "initial_release_date" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "generatorId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Tracking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Generator" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "engineId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Generator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Engine" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "Redhat_Engine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_RevisionHistory" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "trackingId" TEXT,

    CONSTRAINT "Redhat_RevisionHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_ProductTree" (
    "id" TEXT NOT NULL,
    "redhatId" TEXT,

    CONSTRAINT "Redhat_ProductTree_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Branch" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "productTreeId" TEXT,

    CONSTRAINT "Redhat_Branch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Branch2" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "branchId" TEXT,

    CONSTRAINT "Redhat_Branch2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Branch3" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "branch2Id" TEXT,
    "productId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Branch3_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "productIdentificationHelperId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_ProductIdentificationHelper" (
    "id" TEXT NOT NULL,
    "cpe" TEXT NOT NULL,

    CONSTRAINT "Redhat_ProductIdentificationHelper_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability" (
    "id" TEXT NOT NULL,
    "cve" TEXT NOT NULL,
    "discovery_date" TEXT NOT NULL,
    "release_date" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "productStatusId" TEXT NOT NULL,
    "cweId" TEXT NOT NULL,
    "redhatRHSA" TEXT,

    CONSTRAINT "Redhat_Vulnerability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Id" (
    "id" TEXT NOT NULL,
    "system_name" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Id_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Note2" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Note2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_ProductStatus" (
    "id" TEXT NOT NULL,
    "fixed" TEXT[],

    CONSTRAINT "Redhat_ProductStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Reference2" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Reference2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Remediation" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "product_ids" TEXT[],
    "url" TEXT NOT NULL,
    "vulnerabilityId" TEXT,
    "restartRequiredId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Remediation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_RestartRequired" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Redhat_RestartRequired_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Score" (
    "id" TEXT NOT NULL,
    "products" TEXT[],
    "vulnerabilityId" TEXT,
    "cvssV3Id" TEXT NOT NULL,

    CONSTRAINT "Redhat_Score_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_CvssV3" (
    "id" TEXT NOT NULL,
    "attackComplexity" TEXT NOT NULL,
    "attackVector" TEXT NOT NULL,
    "availabilityImpact" TEXT NOT NULL,
    "baseScore" INTEGER NOT NULL,
    "baseSeverity" TEXT NOT NULL,
    "confidentialityImpact" TEXT NOT NULL,
    "integrityImpact" TEXT NOT NULL,
    "privilegesRequired" TEXT NOT NULL,
    "scope" TEXT NOT NULL,
    "userInteraction" TEXT NOT NULL,
    "vectorString" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "Redhat_CvssV3_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Threat" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Threat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Cwe" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Redhat_Cwe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Acknowledgment" (
    "id" TEXT NOT NULL,
    "names" TEXT[],
    "organization" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Acknowledgment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_redhatId_key" ON "Redhat_Document"("redhatId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_AggregateSeverity_documentId_key" ON "Redhat_AggregateSeverity"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Distribution_documentId_key" ON "Redhat_Distribution"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Distribution_tlpId_key" ON "Redhat_Distribution"("tlpId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Tlp_distributionId_key" ON "Redhat_Tlp"("distributionId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_ProductTree_redhatId_key" ON "Redhat_ProductTree"("redhatId");

-- AddForeignKey
ALTER TABLE "Redhat_Document" ADD CONSTRAINT "Redhat_Document_publisherId_fkey" FOREIGN KEY ("publisherId") REFERENCES "Redhat_Publisher"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Document" ADD CONSTRAINT "Redhat_Document_trackingId_fkey" FOREIGN KEY ("trackingId") REFERENCES "Redhat_Tracking"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Document" ADD CONSTRAINT "Redhat_Document_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("RHSA") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_AggregateSeverity" ADD CONSTRAINT "Redhat_AggregateSeverity_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Distribution" ADD CONSTRAINT "Redhat_Distribution_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Tlp" ADD CONSTRAINT "Redhat_Tlp_distributionId_fkey" FOREIGN KEY ("distributionId") REFERENCES "Redhat_Distribution"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Note" ADD CONSTRAINT "Redhat_Note_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Reference" ADD CONSTRAINT "Redhat_Reference_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Tracking" ADD CONSTRAINT "Redhat_Tracking_generatorId_fkey" FOREIGN KEY ("generatorId") REFERENCES "Redhat_Generator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Generator" ADD CONSTRAINT "Redhat_Generator_engineId_fkey" FOREIGN KEY ("engineId") REFERENCES "Redhat_Engine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_RevisionHistory" ADD CONSTRAINT "Redhat_RevisionHistory_trackingId_fkey" FOREIGN KEY ("trackingId") REFERENCES "Redhat_Tracking"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_ProductTree" ADD CONSTRAINT "Redhat_ProductTree_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("RHSA") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Branch" ADD CONSTRAINT "Redhat_Branch_productTreeId_fkey" FOREIGN KEY ("productTreeId") REFERENCES "Redhat_ProductTree"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Branch2" ADD CONSTRAINT "Redhat_Branch2_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Redhat_Branch"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Branch3" ADD CONSTRAINT "Redhat_Branch3_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Redhat_Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Branch3" ADD CONSTRAINT "Redhat_Branch3_branch2Id_fkey" FOREIGN KEY ("branch2Id") REFERENCES "Redhat_Branch2"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Product" ADD CONSTRAINT "Redhat_Product_productIdentificationHelperId_fkey" FOREIGN KEY ("productIdentificationHelperId") REFERENCES "Redhat_ProductIdentificationHelper"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability" ADD CONSTRAINT "Redhat_Vulnerability_productStatusId_fkey" FOREIGN KEY ("productStatusId") REFERENCES "Redhat_ProductStatus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability" ADD CONSTRAINT "Redhat_Vulnerability_cweId_fkey" FOREIGN KEY ("cweId") REFERENCES "Redhat_Cwe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability" ADD CONSTRAINT "Redhat_Vulnerability_redhatRHSA_fkey" FOREIGN KEY ("redhatRHSA") REFERENCES "Redhat"("RHSA") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Id" ADD CONSTRAINT "Redhat_Id_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Note2" ADD CONSTRAINT "Redhat_Note2_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Reference2" ADD CONSTRAINT "Redhat_Reference2_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Remediation" ADD CONSTRAINT "Redhat_Remediation_restartRequiredId_fkey" FOREIGN KEY ("restartRequiredId") REFERENCES "Redhat_RestartRequired"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Remediation" ADD CONSTRAINT "Redhat_Remediation_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Score" ADD CONSTRAINT "Redhat_Score_cvssV3Id_fkey" FOREIGN KEY ("cvssV3Id") REFERENCES "Redhat_CvssV3"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Score" ADD CONSTRAINT "Redhat_Score_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Threat" ADD CONSTRAINT "Redhat_Threat_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Acknowledgment" ADD CONSTRAINT "Redhat_Acknowledgment_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;
