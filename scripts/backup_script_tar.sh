#!/bin/bash

BACKUP_DIR="/backup/developers"
DATE=$(date +'%Y-%m-%d_%I-%M-%S')
BACKUP_FILE=$BACKUP_DIR/developers_backup_$DATE.tar.gz

#Creating the dir backup

mkdir -p $BACKUP_DIR

#Creating a compressed backup of the /shared/developers directory

tar -czf $BACKUP_FILE /shared/developers

echo "backup completed at $(date)" >> /root/rhcsa-practice/logs/backup.log

