#!/bin/bash

# Database credentials
user="MYSQL_ROOT_NAME"
password="MYSQL_ROOT_PASSWORD"
host="localhost"
server=$localhost:3306
db_name="DATABASE_NAME"

# other options
backup_path="PATH_TO_BACKUP"
bucket_name="GCP_BUCKET_NAME"
date=$(date +"%H%M%S%d%b%Y")

# Set default file permissions
chmod 444

# Dump database into SQL file
mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path$server$db_name$date.sql


# Synchronize local backup directory to a Google Cloud Storage bucket
gsutil cp  $backup_path$server$db_name$date.sql   gs://$bucket_name
