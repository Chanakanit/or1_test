#!/bin/bash
# select-study-plans.sh

if [ -f ../../backend/.env ]; then
  set -a
  source ../../backend/.env
  set +a
else
  echo "⚠️  Warning: ./backend/.env not found, using default values."
  DB_HOST=db
  DB_USER=root
  DB_PASSWORD=int504
  DB_NAME=or1
fi

DB_CONTAINER=or1-db

echo "🔍 Selecting all records from study_plans..."
echo "------------------------------------------------"
docker exec -i $DB_CONTAINER mysql -h$DB_HOST -u$DB_USER -p$DB_PASSWORD -e "USE $DB_NAME; SELECT * FROM study_plans;"
echo "------------------------------------------------"
echo "✅ Done."
