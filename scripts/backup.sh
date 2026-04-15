#!/bin/bash

set -e

SOURCE_DIR="$1"
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BACKUP_DIR="$BASE_DIR/backups"
LOG_DIR="$BASE_DIR/logs"
LOG_FILE="$LOG_DIR/backup.log"

TIMESTAMP="$(date +"%Y-%m-%d_%H-%M-%S")"
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

log() {
    local MESSAGE="$1"
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $MESSAGE" >> "$LOG_FILE"
}

error_exit() {
    local MESSAGE="$1"
    log "ERROR: $MESSAGE"=[]
    echo "ERROR: $MESSAGE"
    exit 1
}

if [ -z "$SOURCE_DIR" ]; then
    error_exit "No source directory provided. Usage: ./backup.sh /path/to/source"
fi

if [ ! -d "$SOURCE_DIR" ]; then
    error_exit "Source directory does not exist: $SOURCE_DIR"
fi

mkdir -p "$BACKUP_DIR"
mkdir -p "$LOG_DIR"

log "Backup started for directory: $SOURCE_DIR"

if tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>> "$LOG_FILE"; then
    log "Backup successful: $BACKUP_FILE"
    echo "Backup created successfully: $BACKUP_FILE"
else
    error_exit "Backup failed for directory: $SOURCE_DIR"
fi

log "Backup process completed"

exit 0