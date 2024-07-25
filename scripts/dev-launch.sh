#!/bin/bash

set -e

docker compose rm -sf dev-db
docker compose up -d dev-db
sleep 3

echo "Running migrations..."
export DATABASE_URL="postgres://postgres:password@localhost:5432/pluskids"
yarn prisma migrate deploy
