#!/bin/sh
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backups"
mkdir -p $BACKUP_DIR

echo "Creating backup: $DATE"
docker exec simpleone_db_1 pg_dump -U postgres simpleone > "$BACKUP_DIR/backup_$DATE.sql"

echo " Rotating old backups (keep last 7 days)"
find $BACKUP_DIR -name "backup_*.sql" -mtime +7 -delete
echo "Done"