#!/bin/bash
set -e

if [ $# -eq 0 ]
  then
    echo "migration name not supplied"
	exit 1
fi

yarn prisma-diff $1

yarn create_flyway_migration



