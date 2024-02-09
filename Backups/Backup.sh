# Automating backups is fairly straight forward
# # Going into the crontab and changing the file format
# Setting the file backup so you can verify when this happens.
# crontab -e
# 0 10 * * * /path/to/your/backup/script.sh

# 0 - Minute (0-59)
# 10 - Hour (0-23)
# * - Every day of the month
# * - Every month
# * - Every day of the week (0-6, where Sunday is 0 or 7)


#!/bin/bash

# Your backup commands here
cp -r /path/to/source /path/to/backup/destination

# Optionally, you can log the backup operation
echo "Backup completed at $(date)" >> /path/to/logfile.txt
