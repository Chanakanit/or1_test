#!/bin/bash
# clear-db.sh
# ล้างข้อมูลในตาราง study_plans ภายใน container or1-db

set -e  # ถ้ามีคำสั่งไหน error ให้สคริปต์หยุดทันที

DB_CONTAINER="or1-db"
ENV_FILE="../../backend/.env"
SQL_FILE="../clear_study_plans.sql"

# โหลด environment variables ถ้ามี .env
if [ -f "$ENV_FILE" ]; then
  set -a
  source "$ENV_FILE"
  set +a
else
  echo "⚠️  Warning: $ENV_FILE not found, using default values."
  DB_HOST="db"
  DB_USER="root"
  DB_PASSWORD="int504"
  DB_NAME="or1"
fi

# ตรวจสอบว่า container ทำงานอยู่ไหม
if ! docker ps --format '{{.Names}}' | grep -q "^${DB_CONTAINER}$"; then
  echo "❌ Error: Container '${DB_CONTAINER}' is not running."
  echo "   👉 ลองตรวจสอบด้วย: docker ps"
  exit 1
fi

# ตรวจสอบว่าไฟล์ SQL มีอยู่จริงไหม
if [ ! -f "$SQL_FILE" ]; then
  echo "❌ Error: SQL file '$SQL_FILE' not found."
  exit 1
fi

echo "🧹 Clearing all records from table 'study_plans'..."
docker exec -i "$DB_CONTAINER" \
  mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" < "$SQL_FILE"

if [ $? -eq 0 ]; then
  echo "✅ Cleared successfully."
else
  echo "❌ Failed to clear data."
  exit 1
fi
