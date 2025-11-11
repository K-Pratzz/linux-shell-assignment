#!/bin/bash
# SCRIPT NAME: backup.sh
# PURPOSE: To create a timestamped backup of a specified source directory
#          into a designated backup location.
# AUTHOR: Kumari Pratibha 2501010123
# DATE: 05-11-2025

#Source directory to be backed up
SOURCE_DIR="/home/user/Documents/MyProjectFiles"

#Destination directory where the backup folder will be created
BACKUP_ROOT="/home/user/Backups"

#timestamp for the backup folder
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Extract the base name of the source directory
DIR_NAME=$(basename "$SOURCE_DIR")

# Define the full path for the new timestamped backup directory
DEST_DIR="$BACKUP_ROOT/$DIR_NAME-$TIMESTAMP"

echo "--- Starting Directory Backup ---"
echo "Source: $SOURCE_DIR"
echo "Destination: $DEST_DIR"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory '$SOURCE_DIR' not found. Exiting."
    exit 1
fi

# Create the destination directory recursively if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy the contents of the source directory to the destination
# The -r flag is for recursive copying of directories
cp -r "$SOURCE_DIR" "$DEST_DIR"

# Check the exit status of the copy command
if [ $? -eq 0 ]; then
    echo "Backup successful! New backup created at: $DEST_DIR"
else
    echo "Backup failed. Check permissions or disk space."
fi
