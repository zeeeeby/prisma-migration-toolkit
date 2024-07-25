-- CreateTable
CREATE TABLE "devices" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6),
    "puid" BIGINT NOT NULL,
    "app_id" SMALLINT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "device_info" JSONB,
    "language" TEXT,
    "os_type" SMALLINT,
    "ip" TEXT,

    CONSTRAINT "devices_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "devices_puid_app_id_unique" ON "devices"("puid", "app_id");


CREATE TRIGGER set_devices_updatedAt
    BEFORE UPDATE ON devices
    FOR EACH ROW EXECUTE FUNCTION set_updatedAt_column();

