-- CreateTable
CREATE TABLE "vmware" (
    "cve" TEXT NOT NULL,
    "synopsis" TEXT NOT NULL,
    "severity" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "detail" TEXT NOT NULL,

    CONSTRAINT "vmware_pkey" PRIMARY KEY ("cve")
);

-- CreateTable
CREATE TABLE "oracle" (
    "id" SERIAL NOT NULL,
    "affected_product" TEXT NOT NULL,
    "affected_product_link" TEXT NOT NULL,
    "patch_document" TEXT NOT NULL,
    "patch_document_link" TEXT NOT NULL,

    CONSTRAINT "oracle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "microsoft" (
    "cve" TEXT NOT NULL,
    "release_date" TEXT NOT NULL,
    "revision_date" TEXT NOT NULL,
    "cve_link" TEXT NOT NULL,
    "cve_title" TEXT NOT NULL,
    "impact" TEXT NOT NULL,
    "severity" TEXT NOT NULL,
    "tag" TEXT NOT NULL,

    CONSTRAINT "microsoft_pkey" PRIMARY KEY ("cve")
);

-- CreateTable
CREATE TABLE "hackernews" (
    "title" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "img" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "detail" TEXT NOT NULL,

    CONSTRAINT "hackernews_pkey" PRIMARY KEY ("title")
);

-- CreateTable
CREATE TABLE "Redhat" (
    "id" TEXT NOT NULL,
    "RHSA" TEXT NOT NULL,
    "severity" TEXT NOT NULL,
    "released_on" TEXT NOT NULL,
    "CVEs" TEXT[],
    "bugzillas" TEXT[],
    "released_packages" TEXT[],
    "resource_url" TEXT NOT NULL,

    CONSTRAINT "Redhat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Document" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "csaf_version" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "redhatId" TEXT,
    "aggregateSeverityId" TEXT,
    "distributionId" TEXT,
    "publisherId" TEXT,

    CONSTRAINT "Redhat_Document_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Document_Tracking" (
    "id" TEXT NOT NULL,
    "current_release_date" TEXT NOT NULL,
    "ID" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Document_Tracking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Document_AggregateSeverity" (
    "id" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Document_AggregateSeverity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Document_Distribution" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "documentId" TEXT,
    "tlpId" TEXT,

    CONSTRAINT "Redhat_Document_Distribution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Document_Distribution_Tlp" (
    "id" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "distributionId" TEXT,

    CONSTRAINT "Redhat_Document_Distribution_Tlp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Document_Note" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Document_Note_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Document_Publisher" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "contact_details" TEXT NOT NULL,
    "issuing_authority" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Document_Publisher_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Document_Reference" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Document_Reference_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability" (
    "id" TEXT NOT NULL,
    "cve" TEXT NOT NULL,
    "discovery_date" TEXT NOT NULL,
    "release_date" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "redhatId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Vulnerability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Id" (
    "id" TEXT NOT NULL,
    "system_name" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_Id_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Note" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_Note_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_ProductStatus" (
    "id" TEXT NOT NULL,
    "fixed" TEXT[],
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_ProductStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Reference" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_Reference_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Remediation" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "product_ids" TEXT[],
    "url" TEXT,
    "vulnerabilityId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Vulnerability_Remediation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Remediation_RestartRequired" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT '',
    "remediationId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Vulnerability_Remediation_RestartRequired_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Score" (
    "id" TEXT NOT NULL,
    "products" TEXT[],
    "vulnerabilityId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Vulnerability_Score_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Score_CvssV3" (
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
    "scoreId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Vulnerability_Score_CvssV3_pkey" PRIMARY KEY ("id")
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
    "cweId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "vulnerabilityId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_Cwe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco" (
    "advisoryId" TEXT NOT NULL,
    "advisoryTitle" TEXT NOT NULL,
    "bugIDs" TEXT[],
    "ipsSignatures" TEXT[],
    "cves" TEXT[],
    "cvrfUrl" TEXT NOT NULL,
    "csafUrl" TEXT NOT NULL,
    "cvssBaseScore" TEXT NOT NULL,
    "cwe" TEXT[],
    "firstPublished" TEXT NOT NULL,
    "lastUpdated" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "productNames" TEXT[],
    "publicationUrl" TEXT NOT NULL,
    "sir" TEXT NOT NULL,
    "summary" TEXT NOT NULL,

    CONSTRAINT "Cisco_pkey" PRIMARY KEY ("advisoryId")
);

-- CreateTable
CREATE TABLE "Cisco_Document" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "csaf_version" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "ciscoId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Acknowledgments" (
    "id" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "ciscoDocumentId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Acknowledgments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Note" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "ciscoDocumentId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Note_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Publisher" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "contact_details" TEXT NOT NULL,
    "issuing_authority" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,
    "ciscoDocumentId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Publisher_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_References" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "ciscoDocumentId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_References_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Tracking" (
    "id" TEXT NOT NULL,
    "current_release_date" TEXT NOT NULL,
    "initial_release_date" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "ciscoDocumentId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Tracking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Tracking_Generator" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "ciscoTrackingId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Tracking_Generator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Tracking_Generator_Engine" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "ciscoTrackingGeneratorId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Tracking_Generator_Engine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Document_Tracking_Revision_History" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "ciscoTrackingId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Document_Tracking_Revision_History_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Product_Tree" (
    "id" TEXT NOT NULL,
    "ciscoId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Product_Tree_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Product_Tree_Branches" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "ciscoProductTreeId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Product_Tree_Branches_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Product_Tree_Branches_Branches" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "ciscoProductTreeBranchesId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Product_Tree_Branches_Branches_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Product_Tree_Branches_Branches_Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "ciscoProductTreeBranchesBranchesId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Product_Tree_Branches_Branches_Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Vulnerabilities" (
    "id" TEXT NOT NULL,
    "cve" TEXT NOT NULL,
    "release_date" TEXT,
    "title" TEXT NOT NULL,
    "ciscoId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Vulnerabilities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Vulnerabilities_Ids" (
    "id" TEXT NOT NULL,
    "system_name" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "ciscoVulnerabilitiesId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Vulnerabilities_Ids_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Vulnerabilities_Notes" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "ciscoVulnerabilitiesId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Vulnerabilities_Notes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Vulnerabilities_Product_Status" (
    "id" TEXT NOT NULL,
    "known_affected" TEXT[],
    "ciscoVulnerabilitiesId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Vulnerabilities_Product_Status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Vulnerabilities_Remediation" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "product_ids" TEXT[],
    "url" TEXT,
    "ciscoVulnerabilitiesId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Vulnerabilities_Remediation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Vulnerabilities_Score" (
    "id" TEXT NOT NULL,
    "products" TEXT[],
    "ciscoVulnerabilitiesId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Vulnerabilities_Score_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cisco_Vulnerabilities_Score_Cvss" (
    "id" TEXT NOT NULL,
    "baseScore" INTEGER NOT NULL,
    "baseSeverity" TEXT NOT NULL,
    "vectorString" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "ciscoVulnerabilitiesScoreId" TEXT NOT NULL,

    CONSTRAINT "Cisco_Vulnerabilities_Score_Cvss_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_id_key" ON "Redhat"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_id_key" ON "Redhat_Document"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_redhatId_key" ON "Redhat_Document"("redhatId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Tracking_id_key" ON "Redhat_Document_Tracking"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Tracking_documentId_key" ON "Redhat_Document_Tracking"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_AggregateSeverity_id_key" ON "Redhat_Document_AggregateSeverity"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_AggregateSeverity_documentId_key" ON "Redhat_Document_AggregateSeverity"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Distribution_id_key" ON "Redhat_Document_Distribution"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Distribution_documentId_key" ON "Redhat_Document_Distribution"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Distribution_tlpId_key" ON "Redhat_Document_Distribution"("tlpId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Distribution_Tlp_id_key" ON "Redhat_Document_Distribution_Tlp"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Distribution_Tlp_distributionId_key" ON "Redhat_Document_Distribution_Tlp"("distributionId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Note_id_key" ON "Redhat_Document_Note"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Publisher_id_key" ON "Redhat_Document_Publisher"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Publisher_documentId_key" ON "Redhat_Document_Publisher"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Reference_id_key" ON "Redhat_Document_Reference"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_id_key" ON "Redhat_Vulnerability"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Id_id_key" ON "Redhat_Vulnerability_Id"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Note_id_key" ON "Redhat_Vulnerability_Note"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_ProductStatus_id_key" ON "Redhat_Vulnerability_ProductStatus"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_ProductStatus_vulnerabilityId_key" ON "Redhat_Vulnerability_ProductStatus"("vulnerabilityId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Reference_id_key" ON "Redhat_Vulnerability_Reference"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Remediation_id_key" ON "Redhat_Vulnerability_Remediation"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Remediation_RestartRequired_id_key" ON "Redhat_Vulnerability_Remediation_RestartRequired"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Score_id_key" ON "Redhat_Vulnerability_Score"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Score_CvssV3_id_key" ON "Redhat_Vulnerability_Score_CvssV3"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Score_CvssV3_scoreId_key" ON "Redhat_Vulnerability_Score_CvssV3"("scoreId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Threat_id_key" ON "Redhat_Vulnerability_Threat"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Cwe_id_key" ON "Redhat_Vulnerability_Cwe"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Cwe_vulnerabilityId_key" ON "Redhat_Vulnerability_Cwe"("vulnerabilityId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_advisoryId_key" ON "Cisco"("advisoryId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_id_key" ON "Cisco_Document"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_ciscoId_key" ON "Cisco_Document"("ciscoId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Acknowledgments_id_key" ON "Cisco_Document_Acknowledgments"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Note_id_key" ON "Cisco_Document_Note"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Publisher_id_key" ON "Cisco_Document_Publisher"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Publisher_ciscoDocumentId_key" ON "Cisco_Document_Publisher"("ciscoDocumentId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_References_id_key" ON "Cisco_Document_References"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_id_key" ON "Cisco_Document_Tracking"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_ciscoDocumentId_key" ON "Cisco_Document_Tracking"("ciscoDocumentId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Generator_id_key" ON "Cisco_Document_Tracking_Generator"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Generator_ciscoTrackingId_key" ON "Cisco_Document_Tracking_Generator"("ciscoTrackingId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Generator_Engine_id_key" ON "Cisco_Document_Tracking_Generator_Engine"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Generator_Engine_ciscoTrackingGener_key" ON "Cisco_Document_Tracking_Generator_Engine"("ciscoTrackingGeneratorId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Document_Tracking_Revision_History_id_key" ON "Cisco_Document_Tracking_Revision_History"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Product_Tree_id_key" ON "Cisco_Product_Tree"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Product_Tree_ciscoId_key" ON "Cisco_Product_Tree"("ciscoId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Product_Tree_Branches_id_key" ON "Cisco_Product_Tree_Branches"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Product_Tree_Branches_Branches_id_key" ON "Cisco_Product_Tree_Branches_Branches"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Product_Tree_Branches_Branches_Product_id_key" ON "Cisco_Product_Tree_Branches_Branches_Product"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Product_Tree_Branches_Branches_Product_ciscoProductTr_key" ON "Cisco_Product_Tree_Branches_Branches_Product"("ciscoProductTreeBranchesBranchesId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_id_key" ON "Cisco_Vulnerabilities"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_Ids_id_key" ON "Cisco_Vulnerabilities_Ids"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_Notes_id_key" ON "Cisco_Vulnerabilities_Notes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_Product_Status_id_key" ON "Cisco_Vulnerabilities_Product_Status"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_Product_Status_ciscoVulnerabilitiesId_key" ON "Cisco_Vulnerabilities_Product_Status"("ciscoVulnerabilitiesId");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_Remediation_id_key" ON "Cisco_Vulnerabilities_Remediation"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_Score_id_key" ON "Cisco_Vulnerabilities_Score"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_Score_Cvss_id_key" ON "Cisco_Vulnerabilities_Score_Cvss"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Cisco_Vulnerabilities_Score_Cvss_ciscoVulnerabilitiesScoreI_key" ON "Cisco_Vulnerabilities_Score_Cvss"("ciscoVulnerabilitiesScoreId");

-- AddForeignKey
ALTER TABLE "Redhat_Document" ADD CONSTRAINT "Redhat_Document_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Document_Tracking" ADD CONSTRAINT "Redhat_Document_Tracking_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Document_AggregateSeverity" ADD CONSTRAINT "Redhat_Document_AggregateSeverity_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Document_Distribution" ADD CONSTRAINT "Redhat_Document_Distribution_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Document_Distribution_Tlp" ADD CONSTRAINT "Redhat_Document_Distribution_Tlp_distributionId_fkey" FOREIGN KEY ("distributionId") REFERENCES "Redhat_Document_Distribution"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Document_Note" ADD CONSTRAINT "Redhat_Document_Note_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Document_Publisher" ADD CONSTRAINT "Redhat_Document_Publisher_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Document_Reference" ADD CONSTRAINT "Redhat_Document_Reference_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability" ADD CONSTRAINT "Redhat_Vulnerability_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Id" ADD CONSTRAINT "Redhat_Vulnerability_Id_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Note" ADD CONSTRAINT "Redhat_Vulnerability_Note_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_ProductStatus" ADD CONSTRAINT "Redhat_Vulnerability_ProductStatus_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Reference" ADD CONSTRAINT "Redhat_Vulnerability_Reference_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Remediation" ADD CONSTRAINT "Redhat_Vulnerability_Remediation_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Remediation_RestartRequired" ADD CONSTRAINT "Redhat_Vulnerability_Remediation_RestartRequired_remediati_fkey" FOREIGN KEY ("remediationId") REFERENCES "Redhat_Vulnerability_Remediation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Score" ADD CONSTRAINT "Redhat_Vulnerability_Score_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Score_CvssV3" ADD CONSTRAINT "Redhat_Vulnerability_Score_CvssV3_scoreId_fkey" FOREIGN KEY ("scoreId") REFERENCES "Redhat_Vulnerability_Score"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Threat" ADD CONSTRAINT "Redhat_Vulnerability_Threat_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Cwe" ADD CONSTRAINT "Redhat_Vulnerability_Cwe_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document" ADD CONSTRAINT "Cisco_Document_ciscoId_fkey" FOREIGN KEY ("ciscoId") REFERENCES "Cisco"("advisoryId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Acknowledgments" ADD CONSTRAINT "Cisco_Document_Acknowledgments_ciscoDocumentId_fkey" FOREIGN KEY ("ciscoDocumentId") REFERENCES "Cisco_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Note" ADD CONSTRAINT "Cisco_Document_Note_ciscoDocumentId_fkey" FOREIGN KEY ("ciscoDocumentId") REFERENCES "Cisco_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Publisher" ADD CONSTRAINT "Cisco_Document_Publisher_ciscoDocumentId_fkey" FOREIGN KEY ("ciscoDocumentId") REFERENCES "Cisco_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_References" ADD CONSTRAINT "Cisco_Document_References_ciscoDocumentId_fkey" FOREIGN KEY ("ciscoDocumentId") REFERENCES "Cisco_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Tracking" ADD CONSTRAINT "Cisco_Document_Tracking_ciscoDocumentId_fkey" FOREIGN KEY ("ciscoDocumentId") REFERENCES "Cisco_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Tracking_Generator" ADD CONSTRAINT "Cisco_Document_Tracking_Generator_ciscoTrackingId_fkey" FOREIGN KEY ("ciscoTrackingId") REFERENCES "Cisco_Document_Tracking"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Tracking_Generator_Engine" ADD CONSTRAINT "Cisco_Document_Tracking_Generator_Engine_ciscoTrackingGene_fkey" FOREIGN KEY ("ciscoTrackingGeneratorId") REFERENCES "Cisco_Document_Tracking_Generator"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Document_Tracking_Revision_History" ADD CONSTRAINT "Cisco_Document_Tracking_Revision_History_ciscoTrackingId_fkey" FOREIGN KEY ("ciscoTrackingId") REFERENCES "Cisco_Document_Tracking"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Product_Tree" ADD CONSTRAINT "Cisco_Product_Tree_ciscoId_fkey" FOREIGN KEY ("ciscoId") REFERENCES "Cisco"("advisoryId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Product_Tree_Branches" ADD CONSTRAINT "Cisco_Product_Tree_Branches_ciscoProductTreeId_fkey" FOREIGN KEY ("ciscoProductTreeId") REFERENCES "Cisco_Product_Tree"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Product_Tree_Branches_Branches" ADD CONSTRAINT "Cisco_Product_Tree_Branches_Branches_ciscoProductTreeBranc_fkey" FOREIGN KEY ("ciscoProductTreeBranchesId") REFERENCES "Cisco_Product_Tree_Branches"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Product_Tree_Branches_Branches_Product" ADD CONSTRAINT "Cisco_Product_Tree_Branches_Branches_Product_ciscoProductT_fkey" FOREIGN KEY ("ciscoProductTreeBranchesBranchesId") REFERENCES "Cisco_Product_Tree_Branches_Branches"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Vulnerabilities" ADD CONSTRAINT "Cisco_Vulnerabilities_ciscoId_fkey" FOREIGN KEY ("ciscoId") REFERENCES "Cisco"("advisoryId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Vulnerabilities_Ids" ADD CONSTRAINT "Cisco_Vulnerabilities_Ids_ciscoVulnerabilitiesId_fkey" FOREIGN KEY ("ciscoVulnerabilitiesId") REFERENCES "Cisco_Vulnerabilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Vulnerabilities_Notes" ADD CONSTRAINT "Cisco_Vulnerabilities_Notes_ciscoVulnerabilitiesId_fkey" FOREIGN KEY ("ciscoVulnerabilitiesId") REFERENCES "Cisco_Vulnerabilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Vulnerabilities_Product_Status" ADD CONSTRAINT "Cisco_Vulnerabilities_Product_Status_ciscoVulnerabilitiesI_fkey" FOREIGN KEY ("ciscoVulnerabilitiesId") REFERENCES "Cisco_Vulnerabilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Vulnerabilities_Remediation" ADD CONSTRAINT "Cisco_Vulnerabilities_Remediation_ciscoVulnerabilitiesId_fkey" FOREIGN KEY ("ciscoVulnerabilitiesId") REFERENCES "Cisco_Vulnerabilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Vulnerabilities_Score" ADD CONSTRAINT "Cisco_Vulnerabilities_Score_ciscoVulnerabilitiesId_fkey" FOREIGN KEY ("ciscoVulnerabilitiesId") REFERENCES "Cisco_Vulnerabilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cisco_Vulnerabilities_Score_Cvss" ADD CONSTRAINT "Cisco_Vulnerabilities_Score_Cvss_ciscoVulnerabilitiesScore_fkey" FOREIGN KEY ("ciscoVulnerabilitiesScoreId") REFERENCES "Cisco_Vulnerabilities_Score"("id") ON DELETE CASCADE ON UPDATE CASCADE;
