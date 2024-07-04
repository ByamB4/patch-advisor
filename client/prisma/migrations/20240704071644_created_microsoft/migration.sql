-- CreateTable
CREATE TABLE "microsoft" (
    "cve" TEXT NOT NULL,
    "release_date" TEXT NOT NULL,
    "cve_link" TEXT NOT NULL,
    "cve_title" TEXT NOT NULL,
    "impact" TEXT NOT NULL,
    "severity" TEXT NOT NULL,
    "tag" TEXT NOT NULL,

    CONSTRAINT "microsoft_pkey" PRIMARY KEY ("cve")
);
