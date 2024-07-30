/*
  Warnings:

  - You are about to drop the `redhat` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "redhat";

-- CreateTable
CREATE TABLE "Redhat" (
    "RHSA" TEXT NOT NULL,
    "severity" TEXT NOT NULL,
    "released_on" TEXT NOT NULL,
    "CVES" TEXT[],
    "bugzillas" TEXT[],
    "released_packages" TEXT[],
    "resource_url" TEXT NOT NULL,
    "documentId" TEXT NOT NULL,
    "productTreeId" TEXT NOT NULL,

    CONSTRAINT "Redhat_pkey" PRIMARY KEY ("RHSA")
);

-- CreateTable
CREATE TABLE "Document" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "csaf_version" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "aggregateSeverityId" TEXT NOT NULL,
    "distributionId" TEXT NOT NULL,
    "publisherId" TEXT NOT NULL,
    "trackingId" TEXT NOT NULL,

    CONSTRAINT "Document_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AggregateSeverity" (
    "id" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,
    "text" TEXT NOT NULL,

    CONSTRAINT "AggregateSeverity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Distribution" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "tlpId" TEXT NOT NULL,

    CONSTRAINT "Distribution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tlp" (
    "id" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "Tlp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Note" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Note_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Publisher" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "contact_details" TEXT NOT NULL,
    "issuing_authority" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,

    CONSTRAINT "Publisher_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reference" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Reference_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tracking" (
    "id" TEXT NOT NULL,
    "current_release_date" TEXT NOT NULL,
    "initial_release_date" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "generatorId" TEXT NOT NULL,

    CONSTRAINT "Tracking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Generator" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "engineId" TEXT NOT NULL,

    CONSTRAINT "Generator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Engine" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "Engine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RevisionHistory" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "trackingId" TEXT,

    CONSTRAINT "RevisionHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductTree" (
    "id" TEXT NOT NULL,

    CONSTRAINT "ProductTree_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Branch" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "productTreeId" TEXT,

    CONSTRAINT "Branch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Branch2" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "branchId" TEXT,

    CONSTRAINT "Branch2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Branch3" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "branch2Id" TEXT,
    "productId" TEXT NOT NULL,

    CONSTRAINT "Branch3_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "productIdentificationHelperId" TEXT NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductIdentificationHelper" (
    "id" TEXT NOT NULL,
    "cpe" TEXT NOT NULL,

    CONSTRAINT "ProductIdentificationHelper_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vulnerability" (
    "id" TEXT NOT NULL,
    "cve" TEXT NOT NULL,
    "discovery_date" TEXT NOT NULL,
    "release_date" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "productStatusId" TEXT NOT NULL,
    "cweId" TEXT NOT NULL,
    "redhatRHSA" TEXT,

    CONSTRAINT "Vulnerability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Id" (
    "id" TEXT NOT NULL,
    "system_name" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Id_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Note2" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Note2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductStatus" (
    "id" TEXT NOT NULL,
    "fixed" TEXT[],

    CONSTRAINT "ProductStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reference2" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Reference2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Remediation" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "product_ids" TEXT[],
    "url" TEXT NOT NULL,
    "vulnerabilityId" TEXT,
    "restartRequiredId" TEXT NOT NULL,

    CONSTRAINT "Remediation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RestartRequired" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "RestartRequired_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Score" (
    "id" TEXT NOT NULL,
    "products" TEXT[],
    "vulnerabilityId" TEXT,
    "cvssV3Id" TEXT NOT NULL,

    CONSTRAINT "Score_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CvssV3" (
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

    CONSTRAINT "CvssV3_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Threat" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Threat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cwe" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Cwe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Acknowledgment" (
    "id" TEXT NOT NULL,
    "names" TEXT[],
    "organization" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Acknowledgment_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Redhat" ADD CONSTRAINT "Redhat_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Document"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat" ADD CONSTRAINT "Redhat_productTreeId_fkey" FOREIGN KEY ("productTreeId") REFERENCES "ProductTree"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_aggregateSeverityId_fkey" FOREIGN KEY ("aggregateSeverityId") REFERENCES "AggregateSeverity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_distributionId_fkey" FOREIGN KEY ("distributionId") REFERENCES "Distribution"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_publisherId_fkey" FOREIGN KEY ("publisherId") REFERENCES "Publisher"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_trackingId_fkey" FOREIGN KEY ("trackingId") REFERENCES "Tracking"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Distribution" ADD CONSTRAINT "Distribution_tlpId_fkey" FOREIGN KEY ("tlpId") REFERENCES "Tlp"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Note" ADD CONSTRAINT "Note_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Document"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reference" ADD CONSTRAINT "Reference_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Document"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tracking" ADD CONSTRAINT "Tracking_generatorId_fkey" FOREIGN KEY ("generatorId") REFERENCES "Generator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Generator" ADD CONSTRAINT "Generator_engineId_fkey" FOREIGN KEY ("engineId") REFERENCES "Engine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RevisionHistory" ADD CONSTRAINT "RevisionHistory_trackingId_fkey" FOREIGN KEY ("trackingId") REFERENCES "Tracking"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Branch" ADD CONSTRAINT "Branch_productTreeId_fkey" FOREIGN KEY ("productTreeId") REFERENCES "ProductTree"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Branch2" ADD CONSTRAINT "Branch2_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Branch"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Branch3" ADD CONSTRAINT "Branch3_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Branch3" ADD CONSTRAINT "Branch3_branch2Id_fkey" FOREIGN KEY ("branch2Id") REFERENCES "Branch2"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_productIdentificationHelperId_fkey" FOREIGN KEY ("productIdentificationHelperId") REFERENCES "ProductIdentificationHelper"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vulnerability" ADD CONSTRAINT "Vulnerability_productStatusId_fkey" FOREIGN KEY ("productStatusId") REFERENCES "ProductStatus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vulnerability" ADD CONSTRAINT "Vulnerability_cweId_fkey" FOREIGN KEY ("cweId") REFERENCES "Cwe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vulnerability" ADD CONSTRAINT "Vulnerability_redhatRHSA_fkey" FOREIGN KEY ("redhatRHSA") REFERENCES "Redhat"("RHSA") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Id" ADD CONSTRAINT "Id_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Note2" ADD CONSTRAINT "Note2_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reference2" ADD CONSTRAINT "Reference2_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Remediation" ADD CONSTRAINT "Remediation_restartRequiredId_fkey" FOREIGN KEY ("restartRequiredId") REFERENCES "RestartRequired"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Remediation" ADD CONSTRAINT "Remediation_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Score" ADD CONSTRAINT "Score_cvssV3Id_fkey" FOREIGN KEY ("cvssV3Id") REFERENCES "CvssV3"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Score" ADD CONSTRAINT "Score_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Threat" ADD CONSTRAINT "Threat_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Acknowledgment" ADD CONSTRAINT "Acknowledgment_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;
