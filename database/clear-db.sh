#!/bin/bash
# clear-db.sh
# ล้างข้อมูลในตาราง study_plans

if [ -f ./backend/.env ]; then
  set -a
  source ../backend/.env
  set +a
else
  echo "⚠️  Warning: ../backend/.env not found, using default values."
  DB_HOST=db
  DB_USER=root
  DB_PASSWORD=int504
  DB_NAME=or1
fi

DB_CONTAINER=or1-db

echo "🧹 Clearing all records from study_plans..."
docker exec -i $DB_CONTAINER mysql -h$DB_HOST -u$DB_USER -p$DB_PASSWORD $DB_NAME < ./clear_study_plans.sql
echo "✅ Cleared successfully."
