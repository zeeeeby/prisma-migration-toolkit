-- AlterTable
ALTER TABLE "users" ADD COLUMN     "child_age" SMALLINT,
ADD COLUMN     "child_birth_date" DATE,
ADD COLUMN     "child_gender" SMALLINT,
ADD COLUMN     "debug_mask" BOOLEAN NOT NULL DEFAULT false;

