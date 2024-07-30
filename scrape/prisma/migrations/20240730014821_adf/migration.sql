-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Remediation" DROP CONSTRAINT "Redhat_Vulnerability_Remediation_restartRequiredId_fkey";

-- AlterTable
ALTER TABLE "Redhat_RestartRequired" ADD COLUMN     "redhat_Vulnerability_RemediationId" TEXT,
ADD COLUMN     "vulnerabilityId" TEXT;

-- AddForeignKey
ALTER TABLE "Redhat_RestartRequired" ADD CONSTRAINT "Redhat_RestartRequired_vulnerabilityId_fkey" FOREIGN KEY ("vulnerabilityId") REFERENCES "Redhat_Vulnerability"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_RestartRequired" ADD CONSTRAINT "Redhat_RestartRequired_redhat_Vulnerability_RemediationId_fkey" FOREIGN KEY ("redhat_Vulnerability_RemediationId") REFERENCES "Redhat_Vulnerability_Remediation"("id") ON DELETE SET NULL ON UPDATE CASCADE;
