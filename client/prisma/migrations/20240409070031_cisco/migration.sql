-- CreateTable
CREATE TABLE "cisco" (
    "id" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "impact" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "last_updated" TEXT NOT NULL,
    "clean_cves" TEXT NOT NULL,

    CONSTRAINT "cisco_pkey" PRIMARY KEY ("id")
);
