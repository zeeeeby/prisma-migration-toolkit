-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6),
    "puid" BIGINT NOT NULL,
    "app_id" SMALLINT NOT NULL,
    "appsflyer_id" TEXT NOT NULL,
    "country_code" TEXT,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_puid_app_id_unique" ON "users"("puid", "app_id");

