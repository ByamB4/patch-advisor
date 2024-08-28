/*
  Warnings:

  - You are about to drop the `microsoft` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `oracle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `vmware` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "microsoft";

-- DropTable
DROP TABLE "oracle";

-- DropTable
DROP TABLE "vmware";

-- CreateTable
CREATE TABLE "Vmware" (
    "cve" TEXT NOT NULL,
    "synopsis" TEXT NOT NULL,
    "severity" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "detail" TEXT NOT NULL,

    CONSTRAINT "Vmware_pkey" PRIMARY KEY ("cve")
);

-- CreateTable
CREATE TABLE "Oracle" (
    "id" SERIAL NOT NULL,
    "affected_product" TEXT NOT NULL,
    "affected_product_link" TEXT NOT NULL,
    "patch_document" TEXT NOT NULL,
    "patch_document_link" TEXT NOT NULL,

    CONSTRAINT "Oracle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Microsoft" (
    "cve" TEXT NOT NULL,
    "release_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revision_date" TEXT NOT NULL,
    "cve_link" TEXT NOT NULL,
    "cve_title" TEXT NOT NULL,
    "impact" TEXT NOT NULL,
    "severity" TEXT NOT NULL,
    "tag" TEXT NOT NULL,

    CONSTRAINT "Microsoft_pkey" PRIMARY KEY ("cve")
);
