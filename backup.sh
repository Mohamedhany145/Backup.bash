#!/bin/bash

source_backup="/var/www"          
backup_dir="/backup"                 
limit_days=7                        
logs_dir="/var/log/backup"          
logs_file="$logs_dir/backup.log"      
email="mohamedtestbash@gmail.com"    

mkdir -p "$backup_dir"
mkdir -p "$logs_dir"

today=$(date +"%Y-%m-%d")
backup_file="$backup_dir/backup_$today.tar.gz"

{
    echo "Starting backup: $today"

    tar -czf "$backup_file" "$source_backup" || {
        echo "ERROR: Backup failed at $(date)" >&2
        echo "Backup failure: $today" | mail -s "Backup Failure: $today" "$email"
        exit 1
    }

    find "$backup_dir" -type f -name "backup_*.tar.gz" -mtime +$limit_days -exec rm -f {} \;

    echo "Backup completed successfully: $today" >> "$logs_file"

    log_count=$(ls -1 "$logs_dir"/*.log | wc -l)
    if [ "$log_count" -gt 5 ]; then
        oldest_log=$(ls -t "$logs_dir"/*.log | tail -1)
        rm -f "$oldest_log"
    fi
} >> "$logs_file" 2>&1
