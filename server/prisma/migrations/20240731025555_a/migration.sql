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
CREATE TABLE "cisco" (
    "id" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "impact" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "last_updated" TEXT NOT NULL,
    "clean_cves" TEXT[],

    CONSTRAINT "cisco_pkey" PRIMARY KEY ("id")
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
CREATE TABLE "Redhat_Tracking" (
    "id" TEXT NOT NULL,
    "current_release_date" TEXT NOT NULL,
    "ID" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Tracking_pkey" PRIMARY KEY ("id")
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
CREATE TABLE "Redhat_Document_Note" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Document_Note_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Publisher" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "contact_details" TEXT NOT NULL,
    "issuing_authority" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "namespace" TEXT NOT NULL,
    "documentId" TEXT,

    CONSTRAINT "Redhat_Publisher_pkey" PRIMARY KEY ("id")
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
CREATE TABLE "Redhat_Vulnerability_RestartRequired" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT '',
    "remediationId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Vulnerability_RestartRequired_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_Score" (
    "id" TEXT NOT NULL,
    "products" TEXT[],
    "vulnerabilityId" TEXT NOT NULL,

    CONSTRAINT "Redhat_Vulnerability_Score_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_CvssV3" (
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

    CONSTRAINT "Redhat_Vulnerability_CvssV3_pkey" PRIMARY KEY ("id")
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

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_id_key" ON "Redhat"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_id_key" ON "Redhat_Document"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_redhatId_key" ON "Redhat_Document"("redhatId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Tracking_id_key" ON "Redhat_Tracking"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Tracking_documentId_key" ON "Redhat_Tracking"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_AggregateSeverity_id_key" ON "Redhat_AggregateSeverity"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_AggregateSeverity_documentId_key" ON "Redhat_AggregateSeverity"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Distribution_id_key" ON "Redhat_Distribution"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Distribution_documentId_key" ON "Redhat_Distribution"("documentId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Distribution_tlpId_key" ON "Redhat_Distribution"("tlpId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Tlp_id_key" ON "Redhat_Tlp"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Tlp_distributionId_key" ON "Redhat_Tlp"("distributionId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Document_Note_id_key" ON "Redhat_Document_Note"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Publisher_id_key" ON "Redhat_Publisher"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Publisher_documentId_key" ON "Redhat_Publisher"("documentId");

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
CREATE UNIQUE INDEX "Redhat_Vulnerability_RestartRequired_id_key" ON "Redhat_Vulnerability_RestartRequired"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Score_id_key" ON "Redhat_Vulnerability_Score"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_CvssV3_id_key" ON "Redhat_Vulnerability_CvssV3"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_CvssV3_scoreId_key" ON "Redhat_Vulnerability_CvssV3"("scoreId");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Threat_id_key" ON "Redhat_Vulnerability_Threat"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Cwe_id_key" ON "Redhat_Vulnerability_Cwe"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_Cwe_vulnerabilityId_key" ON "Redhat_Vulnerability_Cwe"("vulnerabilityId");

-- AddForeignKey
ALTER TABLE "Redhat_Document" ADD CONSTRAINT "Redhat_Document_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Tracking" ADD CONSTRAINT "Redhat_Tracking_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_AggregateSeverity" ADD CONSTRAINT "Redhat_AggregateSeverity_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Distribution" ADD CONSTRAINT "Redhat_Distribution_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Tlp" ADD CONSTRAINT "Redhat_Tlp_distributionId_fkey" FOREIGN KEY ("distributionId") REFERENCES "Redhat_Distribution"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Document_Note" ADD CONSTRAINT "Redhat_Document_Note_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Publisher" ADD CONSTRAINT "Redhat_Publisher_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Redhat_Document"("id") ON DELETE CASCADE ON UPDATE CASCADE;

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
ALTER TABLE "Redhat_Vulnerability_RestartRequired" ADD CONSTRAINT "Redhat_Vulnerability_RestartRequired_remediationId_fkey" FOREIGN KEY ("remediationId") REFERENCES "Redhat_Vulnerability_Remediation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Score" ADD CONSTRAINT "Redhat_Vulnerability_Score_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_CvssV3" ADD CONSTRAINT "Redhat_Vulnerability_CvssV3_scoreId_fkey" FOREIGN KEY ("scoreId") REFERENCES "Redhat_Vulnerability_Score"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Threat" ADD CONSTRAINT "Redhat_Vulnerability_Threat_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Cwe" ADD CONSTRAINT "Redhat_Vulnerability_Cwe_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE CASCADE ON UPDATE CASCADE;
