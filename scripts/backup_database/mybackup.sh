#!/bin/bash
cd /home/ubuntu/tmp/backuptmp
file=$(date +%d).sql
mysqldump \
  --host ${MYSQL_HOST} \
  -u ${MYSQL_USER} \
  --password="${MYSQL_PASS}" \
  ${MYSQL_DB} > ${file}
if [ "${?}" -eq 0 ]; then
  gzip ${file}
  aws s3 cp ${file}.gz s3://${S3_BUCKET}
  if [ $(date +%d) == 21 ]; then
  	echo "Date begins with 21! archiving monthly entry"
  	file_month=$(date +%d-%m-%Y).sql
  	mv ${file}.gz ${file_month}.gz
  	aws s3 cp ${file_month}.gz s3://${S3_BUCKET}
  	rm ${file_month}.gz
  else
  	rm ${file}.gz
  fi
  
  	
else
  echo "Error backing up mysql"
  exit 255
fi
