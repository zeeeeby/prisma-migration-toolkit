#!/bin/bash

# scripts creates copy of migrations in flyway format

DIRECTORY="./prisma/migrations"
TARGET_DIRECTORY="./prisma/flyway_readonly_migrations"

rm -rf $TARGET_DIRECTORY
mkdir -p $TARGET_DIRECTORY


for DIR in "$DIRECTORY"/*/; do
  if [ -d "$DIR" ]; then
    DIR_NAME=$(basename "$DIR")
    cp $DIR/migration.sql $TARGET_DIRECTORY/$DIR_NAME.sql
  fi
done




