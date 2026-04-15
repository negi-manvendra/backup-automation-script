# 🔐 Backup Automation Script (Bash)

A **production-ready Bash automation script** that performs directory backups with compression, logging, and error handling — built using real DevOps practices.

---

## 📌 Overview

This project automates the process of:

* 📦 Backing up directories
* 🗜️ Compressing files (`.tar.gz`)
* 🕒 Maintaining timestamped versions
* 📝 Logging operations for observability
* ⚠️ Handling errors safely

---

## 🖼️ Architecture Diagram

```text
+----------------------+
|   User / Cron Job    |
+----------+-----------+
           |
           ↓
+----------------------+
|   backup.sh script   |
+----------+-----------+
           |
   ----------------------
   |        |           |
   ↓        ↓           ↓
Validate   Log Start   Generate Timestamp
Input
   |
   ↓
+----------------------+
|   tar + gzip         |
|   (Backup Engine)    |
+----------+-----------+
           |
           ↓
+----------------------+
| backups/ directory   |
| backup_*.tar.gz      |
+----------+-----------+
           |
           ↓
+----------------------+
| logs/backup.log      |
| (append logs/errors) |
+----------------------+
```

---

## ⚙️ Features

✔ Timestamp-based backup files
✔ Compression using `tar` + `gzip`
✔ Structured logging system
✔ Input validation & error handling
✔ Clean and modular project structure
✔ Cron-ready automation

---

## 📂 Project Structure

```bash
backup-automation/
│
├── scripts/
│   └── backup.sh
│
├── logs/
│   └── backup.log
│
├── backups/
│
├── .gitignore
└── README.md
```

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/backup-automation-script.git
cd backup-automation-script
```

---

### 2. Make Script Executable

```bash
chmod +x scripts/backup.sh
```

---

### 3. Run the Script

```bash
./scripts/backup.sh /path/to/directory
```

---

## 📌 Example

```bash
./scripts/backup.sh /home/user/data
```

✔ Output:

```bash
backups/backup_2026-04-15_12-30-00.tar.gz
```

---

## 📝 Logging System

Logs are stored in:

```bash
logs/backup.log
```

Example:

```text
[2026-04-15 12:30:00] Backup started for /home/user/data
[2026-04-15 12:30:02] Backup successful: backups/backup_2026-04-15_12-30-00.tar.gz
[2026-04-15 12:30:02] Backup completed
```

---

## ⚠️ Error Handling

The script handles:

* Missing input directory
* Invalid paths
* Backup failures

Uses proper exit codes and logging for debugging.

---

## ⏱️ Automation with Cron

```bash
crontab -e
```

Example (daily at 2 AM):

```bash
0 2 * * * /full/path/scripts/backup.sh /path/to/data
```

---

## 🧠 Key Concepts Used

* Bash scripting
* Linux file system
* Archiving (`tar`)
* Compression (`gzip`)
* Logging & redirection
* Error handling

---

## 🔧 Requirements

* Linux / WSL / macOS
* Bash shell
* `tar` utility

---

## 📈 Future Improvements

* Incremental backups
* Backup rotation (retention policy)
* Cloud upload (AWS S3)
* Notifications (email/Slack)

---

## 👨‍💻 Author

**Manvendra Negi**

---

## ⭐ Why This Project Matters

This project demonstrates:

* Real-world DevOps automation
* Strong Linux fundamentals
* Production-style scripting
* Clean system design

---

## 📬 Feedback

Feel free to open issues or contribute!
