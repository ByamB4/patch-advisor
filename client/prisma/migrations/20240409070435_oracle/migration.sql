-- CreateTable
CREATE TABLE "oracle" (
    "id" SERIAL NOT NULL,
    "affected_product" TEXT NOT NULL,
    "affected_product_link" TEXT NOT NULL,
    "patch_document" TEXT NOT NULL,
    "patch_document_link" TEXT NOT NULL,

    CONSTRAINT "oracle_pkey" PRIMARY KEY ("id")
);
