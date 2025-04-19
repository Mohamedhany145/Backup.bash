# 🛠 Daily System Backup Automation Script

## 📋 Overview

This project contains a Bash script that automates daily backups for a specified directory. The script compresses the backups, rotates old backups and logs, and sends failure alerts using Postfix if anything goes wrong.

---

## 📁 What This Script Does

- 📦 **Backs up** a specified directory (e.g., `/etc`, `/var/www`) in `.tar.gz` format.
- 💾 **Stores** the backups in a defined backup directory.
- 🔁 **Rotates** old backups and logs based on configurable retention settings.
- 📧 **Sends an email alert** using Postfix if any part of the backup fails.
- ⏰ **Scheduled daily** using a cron job.

---

## ⚙️ Configuration

Edit the script and set the following variables at the top:

```bash
# === Configuration ===
BACKUP_SRC="/etc"                # Directory to back up
BACKUP_DEST="/var/backups"       # Directory to store the backups
LOG_FILE="/var/log/backup.log"   # Log file location
RETENTION_DAYS=7                 # Number of backups to keep
LOG_RETENTION=5                  # Number of log files to retain
EMAIL_TO="admin@example.com"     # Recipient of failure alerts
```

---

## 🚀 How to Run and Test the Script

### 🧪 Manual Test

1. Make the script executable:
   ```bash
   chmod +x backup.sh
   ```

2. Run the script manually:
   ```bash
   ./backup.sh
   ```

3. Check:
   - Backup archive in the destination folder
   - Logs in `/var/log/backup.log`
   - Email alert if something fails (Postfix must be configured)

---

## 🔄 Cron Job Setup

To schedule the backup daily at 2 AM:

```bash
0 2 * * * /path/to/backup.sh
```

Add this line to the crontab using:

```bash
crontab -e
```

---

## 🛠 How to Configure Paths and Retention

You can change the source folder, destination path, number of retained backups/logs, and email recipient by editing the variables at the top of the script.

Example:

```bash
BACKUP_SRC="/var/www"
BACKUP_DEST="/mnt/backup"
RETENTION_DAYS=5
EMAIL_TO="you@domain.com"
```

---

## 🧪 How to Test Failure Alerts

You can simulate a failure to ensure the alert system works:

### Option 1: Use an invalid path

```bash
BACKUP_SRC="/invalid/path"
./backup.sh
```

### Option 2: Change permissions on the backup destination

```bash
chmod -w /var/backups
./backup.sh
```

Check your mail with:

```bash
mail
```

> **Note:** Ensure Postfix is installed and configured to send local emails:
```bash
sudo apt install postfix
```

---

## 📁 Repository Structure

```
.
├── backup.sh
├── README.md
```

---

Let me know if you'd like me to generate the actual `backup.sh` script too or help you structure the GitHub repo.
