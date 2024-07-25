#!/bin/bash
set -e

if [ $# -eq 0 ]
  then
    echo "migration name not supplied"
	exit 1
fi

# migration file
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
FILE_DIR=./prisma/migrations/V${TIMESTAMP}__$1
FILE_NAME=$FILE_DIR/migration.sql
mkdir -p $FILE_DIR

export DATABASE_URL="postgres://postgres:password@localhost:5432/pluskids"
export SHADOW_DATABASE_URL="postgres://postgres:password@localhost:5432/pluskids_shadow"
# update prisma schema from db
yarn prisma db pull
# generate diff
yarn --silent prisma migrate diff --from-migrations prisma/migrations --shadow-database-url $SHADOW_DATABASE_URL --to-schema-datamodel  prisma/schema.prisma --script > $FILE_NAME

# cleanup
if grep -q 'This is an empty migration.' $FILE_NAME; then
  echo 'This is an empty migration.'
  rm $FILE_NAME
  rmdir $FILE_DIR
fi

