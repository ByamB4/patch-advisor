-- CreateTable
CREATE TABLE "hackernews" (
    "title" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "img" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "detail" TEXT NOT NULL,

    CONSTRAINT "hackernews_pkey" PRIMARY KEY ("title")
);
