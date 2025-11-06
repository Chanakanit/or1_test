#!/bin/bash

# ใช้ docker exec รัน MySQL
# $@ คืออะไรก็ได้ที่คุณส่งมาข้างหลังไฟล์นี้
docker exec -i or1-db mysql -uroot -pint504 "$@"
