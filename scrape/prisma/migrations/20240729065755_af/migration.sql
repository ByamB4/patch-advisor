/*
  Warnings:

  - You are about to drop the `Acknowledgment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AggregateSeverity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Branch` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Branch2` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Branch3` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CvssV3` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cwe` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Distribution` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Document` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Engine` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Generator` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Id` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Note` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Note2` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProductIdentificationHelper` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProductStatus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProductTree` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Publisher` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Reference` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Reference2` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Remediation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RestartRequired` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RevisionHistory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Score` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Threat` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Tlp` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Tracking` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Vulnerability` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Acknowledgment" DROP CONSTRAINT "Acknowledgment_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "AggregateSeverity" DROP CONSTRAINT "AggregateSeverity_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Branch" DROP CONSTRAINT "Branch_productTreeId_fkey";

-- DropForeignKey
ALTER TABLE "Branch2" DROP CONSTRAINT "Branch2_branchId_fkey";

-- DropForeignKey
ALTER TABLE "Branch3" DROP CONSTRAINT "Branch3_branch2Id_fkey";

-- DropForeignKey
ALTER TABLE "Branch3" DROP CONSTRAINT "Branch3_productId_fkey";

-- DropForeignKey
ALTER TABLE "Document" DROP CONSTRAINT "Document_distributionId_fkey";

-- DropForeignKey
ALTER TABLE "Document" DROP CONSTRAINT "Document_publisherId_fkey";

-- DropForeignKey
ALTER TABLE "Document" DROP CONSTRAINT "Document_redhatId_fkey";

-- DropForeignKey
ALTER TABLE "Document" DROP CONSTRAINT "Document_trackingId_fkey";

-- DropForeignKey
ALTER TABLE "Generator" DROP CONSTRAINT "Generator_engineId_fkey";

-- DropForeignKey
ALTER TABLE "Id" DROP CONSTRAINT "Id_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Note" DROP CONSTRAINT "Note_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Note2" DROP CONSTRAINT "Note2_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_productIdentificationHelperId_fkey";

-- DropForeignKey
ALTER TABLE "ProductTree" DROP CONSTRAINT "ProductTree_redhatId_fkey";

-- DropForeignKey
ALTER TABLE "Reference" DROP CONSTRAINT "Reference_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Reference2" DROP CONSTRAINT "Reference2_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Remediation" DROP CONSTRAINT "Remediation_restartRequiredId_fkey";

-- DropForeignKey
ALTER TABLE "Remediation" DROP CONSTRAINT "Remediation_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "RevisionHistory" DROP CONSTRAINT "RevisionHistory_trackingId_fkey";

-- DropForeignKey
ALTER TABLE "Score" DROP CONSTRAINT "Score_cvssV3Id_fkey";

-- DropForeignKey
ALTER TABLE "Score" DROP CONSTRAINT "Score_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Threat" DROP CONSTRAINT "Threat_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Tlp" DROP CONSTRAINT "Tlp_distributionId_fkey";

-- DropForeignKey
ALTER TABLE "Tracking" DROP CONSTRAINT "Tracking_generatorId_fkey";

-- DropForeignKey
ALTER TABLE "Vulnerability" DROP CONSTRAINT "Vulnerability_cweId_fkey";

-- DropForeignKey
ALTER TABLE "Vulnerability" DROP CONSTRAINT "Vulnerability_productStatusId_fkey";

-- DropForeignKey
ALTER TABLE "Vulnerability" DROP CONSTRAINT "Vulnerability_redhatRHSA_fkey";

-- DropTable
DROP TABLE "Acknowledgment";

-- DropTable
DROP TABLE "AggregateSeverity";

-- DropTable
DROP TABLE "Branch";

-- DropTable
DROP TABLE "Branch2";

-- DropTable
DROP TABLE "Branch3";

-- DropTable
DROP TABLE "CvssV3";

-- DropTable
DROP TABLE "Cwe";

-- DropTable
DROP TABLE "Distribution";

-- DropTable
DROP TABLE "Document";

-- DropTable
DROP TABLE "Engine";

-- DropTable
DROP TABLE "Generator";

-- DropTable
DROP TABLE "Id";

-- DropTable
DROP TABLE "Note";

-- DropTable
DROP TABLE "Note2";

-- DropTable
DROP TABLE "Product";

-- DropTable
DROP TABLE "ProductIdentificationHelper";

-- DropTable
DROP TABLE "ProductStatus";

-- DropTable
DROP TABLE "ProductTree";

-- DropTable
DROP TABLE "Publisher";

-- DropTable
DROP TABLE "Reference";

-- DropTable
DROP TABLE "Reference2";

-- DropTable
DROP TABLE "Remediation";

-- DropTable
DROP TABLE "RestartRequired";

-- DropTable
DROP TABLE "RevisionHistory";

-- DropTable
DROP TABLE "Score";

-- DropTable
DROP TABLE "Threat";

-- DropTable
DROP TABLE "Tlp";

-- DropTable
DROP TABLE "Tracking";

-- DropTable
DROP TABLE "Vulnerability";

-- CreateTable
CREATE TABLE "RedhatDocument" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "csaf_version" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "aggregateSeverityId" TEXT NOT NULL,
    "distributionId" TEXT NOT NULL,
    "publisherId" TEXT NOT NULL,
    "trackingId" TEXT NOT NULL,
    "redhatId" TEXT,

    CONSTRAINT "RedhatDocument_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatAggregateSeverity" (
    "id" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "RedhatAggregateSeverity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatDistribution" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "documentId" TEXT,
    "tlpId" TEXT,

    CONSTRAINT "RedhatDistribution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatTlp" (
    "id" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "distributionId" TEXT,

    CONSTRAINT "RedhatTlp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatNote" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "RedhatNote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatPublisher" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "contact_details" TEXT NOT NULL,
    "issuing_authority" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,

    CONSTRAINT "RedhatPublisher_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatReference" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "RedhatReference_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatTracking" (
    "id" TEXT NOT NULL,
    "current_release_date" TEXT NOT NULL,
    "initial_release_date" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "generatorId" TEXT NOT NULL,

    CONSTRAINT "RedhatTracking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatGenerator" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "engineId" TEXT NOT NULL,

    CONSTRAINT "RedhatGenerator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatEngine" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RedhatEngine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatRevisionHistory" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "trackingId" TEXT,

    CONSTRAINT "RedhatRevisionHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatProductTree" (
    "id" TEXT NOT NULL,
    "redhatId" TEXT,

    CONSTRAINT "RedhatProductTree_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatBranch" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "productTreeId" TEXT,

    CONSTRAINT "RedhatBranch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatBranch2" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "branchId" TEXT,

    CONSTRAINT "RedhatBranch2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatBranch3" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "branch2Id" TEXT,
    "productId" TEXT NOT NULL,

    CONSTRAINT "RedhatBranch3_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatProduct" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "productIdentificationHelperId" TEXT NOT NULL,

    CONSTRAINT "RedhatProduct_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatProductIdentificationHelper" (
    "id" TEXT NOT NULL,
    "cpe" TEXT NOT NULL,

    CONSTRAINT "RedhatProductIdentificationHelper_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatVulnerability" (
    "id" TEXT NOT NULL,
    "cve" TEXT NOT NULL,
    "discovery_date" TEXT NOT NULL,
    "release_date" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "productStatusId" TEXT NOT NULL,
    "cweId" TEXT NOT NULL,
    "redhatRHSA" TEXT,

    CONSTRAINT "RedhatVulnerability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatId" (
    "id" TEXT NOT NULL,
    "system_name" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "RedhatId_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatNote2" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "RedhatNote2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatProductStatus" (
    "id" TEXT NOT NULL,
    "fixed" TEXT[],

    CONSTRAINT "RedhatProductStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatReference2" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "RedhatReference2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatRemediation" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "product_ids" TEXT[],
    "url" TEXT NOT NULL,
    "vulnerabilityId" TEXT,
    "restartRequiredId" TEXT NOT NULL,

    CONSTRAINT "RedhatRemediation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatRestartRequired" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "RedhatRestartRequired_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatScore" (
    "id" TEXT NOT NULL,
    "products" TEXT[],
    "vulnerabilityId" TEXT,
    "cvssV3Id" TEXT NOT NULL,

    CONSTRAINT "RedhatScore_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatCvssV3" (
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

    CONSTRAINT "RedhatCvssV3_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatThreat" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "RedhatThreat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatCwe" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "RedhatCwe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedhatAcknowledgment" (
    "id" TEXT NOT NULL,
    "names" TEXT[],
    "organization" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "RedhatAcknowledgment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "RedhatDocument_redhatId_key" ON "RedhatDocument"("redhatId");

-- CreateIndex
CREATE UNIQUE INDEX "RedhatAggregateSeverity_documentId_key" ON "RedhatAggregateSeverity"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "RedhatDistribution_documentId_key" ON "RedhatDistribution"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "RedhatDistribution_tlpId_key" ON "RedhatDistribution"("tlpId");

-- CreateIndex
CREATE UNIQUE INDEX "RedhatTlp_distributionId_key" ON "RedhatTlp"("distributionId");

-- CreateIndex
CREATE UNIQUE INDEX "RedhatProductTree_redhatId_key" ON "RedhatProductTree"("redhatId");

-- AddForeignKey
ALTER TABLE "RedhatDocument" ADD CONSTRAINT "RedhatDocument_publisherId_fkey" FOREIGN KEY ("publisherId") REFERENCES "RedhatPublisher"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatDocument" ADD CONSTRAINT "RedhatDocument_trackingId_fkey" FOREIGN KEY ("trackingId") REFERENCES "RedhatTracking"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatDocument" ADD CONSTRAINT "RedhatDocument_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("RHSA") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatAggregateSeverity" ADD CONSTRAINT "RedhatAggregateSeverity_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "RedhatDocument"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatDistribution" ADD CONSTRAINT "RedhatDistribution_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "RedhatDocument"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatTlp" ADD CONSTRAINT "RedhatTlp_distributionId_fkey" FOREIGN KEY ("distributionId") REFERENCES "RedhatDistribution"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatNote" ADD CONSTRAINT "RedhatNote_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "RedhatDocument"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatReference" ADD CONSTRAINT "RedhatReference_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "RedhatDocument"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatTracking" ADD CONSTRAINT "RedhatTracking_generatorId_fkey" FOREIGN KEY ("generatorId") REFERENCES "RedhatGenerator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatGenerator" ADD CONSTRAINT "RedhatGenerator_engineId_fkey" FOREIGN KEY ("engineId") REFERENCES "RedhatEngine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatRevisionHistory" ADD CONSTRAINT "RedhatRevisionHistory_trackingId_fkey" FOREIGN KEY ("trackingId") REFERENCES "RedhatTracking"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatProductTree" ADD CONSTRAINT "RedhatProductTree_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("RHSA") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatBranch" ADD CONSTRAINT "RedhatBranch_productTreeId_fkey" FOREIGN KEY ("productTreeId") REFERENCES "RedhatProductTree"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatBranch2" ADD CONSTRAINT "RedhatBranch2_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "RedhatBranch"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatBranch3" ADD CONSTRAINT "RedhatBranch3_productId_fkey" FOREIGN KEY ("productId") REFERENCES "RedhatProduct"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatBranch3" ADD CONSTRAINT "RedhatBranch3_branch2Id_fkey" FOREIGN KEY ("branch2Id") REFERENCES "RedhatBranch2"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatProduct" ADD CONSTRAINT "RedhatProduct_productIdentificationHelperId_fkey" FOREIGN KEY ("productIdentificationHelperId") REFERENCES "RedhatProductIdentificationHelper"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatVulnerability" ADD CONSTRAINT "RedhatVulnerability_productStatusId_fkey" FOREIGN KEY ("productStatusId") REFERENCES "RedhatProductStatus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatVulnerability" ADD CONSTRAINT "RedhatVulnerability_cweId_fkey" FOREIGN KEY ("cweId") REFERENCES "RedhatCwe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatVulnerability" ADD CONSTRAINT "RedhatVulnerability_redhatRHSA_fkey" FOREIGN KEY ("redhatRHSA") REFERENCES "Redhat"("RHSA") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatId" ADD CONSTRAINT "RedhatId_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "RedhatVulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatNote2" ADD CONSTRAINT "RedhatNote2_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "RedhatVulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatReference2" ADD CONSTRAINT "RedhatReference2_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "RedhatVulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatRemediation" ADD CONSTRAINT "RedhatRemediation_restartRequiredId_fkey" FOREIGN KEY ("restartRequiredId") REFERENCES "RedhatRestartRequired"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatRemediation" ADD CONSTRAINT "RedhatRemediation_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "RedhatVulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatScore" ADD CONSTRAINT "RedhatScore_cvssV3Id_fkey" FOREIGN KEY ("cvssV3Id") REFERENCES "RedhatCvssV3"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatScore" ADD CONSTRAINT "RedhatScore_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "RedhatVulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatThreat" ADD CONSTRAINT "RedhatThreat_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "RedhatVulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedhatAcknowledgment" ADD CONSTRAINT "RedhatAcknowledgment_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "RedhatVulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;
