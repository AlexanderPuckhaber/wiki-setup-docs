#!/bin/bash
AWS_ACCESS_KEY_ID=<redacted> \
AWS_SECRET_ACCESS_KEY=<redacted> \
AWS_DEFAULT_REGION=us-east-1 \
S3_BUCKET=gt-student-wiki-database-backups \
MYSQL_HOST=localhost \
MYSQL_USER=mediawiki \
MYSQL_PASS=<redacted> \
MYSQL_DB=gt_wiki \
/home/ubuntu/mediawiki_scripts/backup_scripts/mybackup.sh