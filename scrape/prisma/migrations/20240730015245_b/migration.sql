/*
  Warnings:

  - You are about to drop the `Redhat_CvssV3` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redhat_RestartRequired` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Redhat_RestartRequired" DROP CONSTRAINT "Redhat_RestartRequired_redhat_Vulnerability_RemediationId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_RestartRequired" DROP CONSTRAINT "Redhat_RestartRequired_vulnerabilityId_fkey";

-- DropForeignKey
ALTER TABLE "Redhat_Vulnerability_Score" DROP CONSTRAINT "Redhat_Vulnerability_Score_cvssV3Id_fkey";

-- DropTable
DROP TABLE "Redhat_CvssV3";

-- DropTable
DROP TABLE "Redhat_RestartRequired";

-- CreateTable
CREATE TABLE "Redhat_Vulnerability_RestartRequired" (
    "id" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT '',
    "remediationId" TEXT,

    CONSTRAINT "Redhat_Vulnerability_RestartRequired_pkey" PRIMARY KEY ("id")
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

    CONSTRAINT "Redhat_Vulnerability_CvssV3_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_RestartRequired_id_key" ON "Redhat_Vulnerability_RestartRequired"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_CvssV3_id_key" ON "Redhat_Vulnerability_CvssV3"("id");

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_RestartRequired" ADD CONSTRAINT "Redhat_Vulnerability_RestartRequired_remediationId_fkey" FOREIGN KEY ("remediationId") REFERENCES "Redhat_Vulnerability_Remediation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Redhat_Vulnerability_Score" ADD CONSTRAINT "Redhat_Vulnerability_Score_cvssV3Id_fkey" FOREIGN KEY ("cvssV3Id") REFERENCES "Redhat_Vulnerability_CvssV3"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
