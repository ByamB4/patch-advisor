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
