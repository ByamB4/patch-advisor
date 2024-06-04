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
