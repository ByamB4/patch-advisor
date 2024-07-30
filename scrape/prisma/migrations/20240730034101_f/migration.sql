/*
  Warnings:

  - A unique constraint covering the columns `[redhatId]` on the table `Redhat_Vulnerability` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Redhat_Vulnerability_redhatId_key" ON "Redhat_Vulnerability"("redhatId");
