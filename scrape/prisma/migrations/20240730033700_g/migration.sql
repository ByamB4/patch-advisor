-- DropForeignKey
ALTER TABLE "Redhat_AggregateSeverity" DROP CONSTRAINT "Redhat_AggregateSeverity_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Distribution" DROP CONSTRAINT "Redhat_Distribution_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Document" DROP CONSTRAINT "Redhat_Document_redhatId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Document_Note" DROP CONSTRAINT "Redhat_Document_Note_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Document_Reference" DROP CONSTRAINT "Redhat_Document_Reference_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Publisher" DROP CONSTRAINT "Redhat_Publisher_documentId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Tlp" DROP CONSTRAINT "Redhat_Tlp_distributionId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability" DROP CONSTRAINT "Redhat_Vulnerability_redhatId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_CvssV3" DROP CONSTRAINT "Redhat_Vulnerability_CvssV3_scoreId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Cwe" DROP CONSTRAINT "Redhat_Vulnerability_Cwe_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Id" DROP CONSTRAINT "Redhat_Vulnerability_Id_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Note" DROP CONSTRAINT "Redhat_Vulnerability_Note_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_ProductStatus" DROP CONSTRAINT "Redhat_Vulnerability_ProductStatus_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Reference" DROP CONSTRAINT "Redhat_Vulnerability_Reference_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Remediation" DROP CONSTRAINT "Redhat_Vulnerability_Remediation_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_RestartRequired" DROP CONSTRAINT "Redhat_Vulnerability_RestartRequired_remediationId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Score" DROP CONSTRAINT "Redhat_Vulnerability_Score_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Threat" DROP CONSTRAINT "Redhat_Vulnerability_Threat_vulnerabilityId_fkey";

-- AddForeignKey
ALTER TABLE "Redhat_Document" ADD CONSTRAINT "Redhat_Document_redhatId_fkey" FOREIGN KEY ("redhatId") REFERENCES "Redhat"("id") ON DELETE CASCADE ON UPDATE CASCADE;

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
