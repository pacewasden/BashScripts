#!/bin/bash

# Set the source and destination directories
source_dir="/path/to/source"
destination_dir="/path/to/backup"

# Create a timestamp for the backup
timestamp=$(date +"%Y%m%d%H%M%S")

# Create a tarball (compressed archive) of the source directory
tar -czf "$destination_dir/backup_$timestamp.tar.gz" -C "$source_dir" .

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup successful! Backup saved as backup_$timestamp.tar.gz in $destination_dir."
else
  echo "Backup failed. Check for errors."
fi
