-- CreateTable
CREATE TABLE "redhat" (
    "cve" TEXT NOT NULL,
    "synopsis" TEXT NOT NULL,
    "severity" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "solution" TEXT NOT NULL,
    "affected_products" TEXT NOT NULL,
    "fixes" TEXT NOT NULL,
    "cves" TEXT NOT NULL,
    "references" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "topics" TEXT[],

    CONSTRAINT "redhat_pkey" PRIMARY KEY ("cve")
);

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
