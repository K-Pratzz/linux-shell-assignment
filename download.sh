#!/bin/bash
# SCRIPT NAME: download.sh
# PURPOSE: Automatically downloads a file from a specified URL using wget
#          and stores it in a predefined local directory.
# AUTHOR: Kumari Pratibha 2501010123
# DATE: 04-11-2025

# 1. URL of the file to download
DOWNLOAD_URL="http://example.com/example.pdf"

# 2. Local directory where the file will be saved
DESTINATION_DIR="/home/user/Downloads/Automated"

echo "--- Starting Automated Download ---"
echo "URL: $DOWNLOAD_URL"
echo "Target Directory: $DESTINATION_DIR"

# Check if the destination directory exists, if not, create it
if [ ! -d "$DESTINATION_DIR" ]; then
    echo "Destination directory not found. Creating $DESTINATION_DIR..."
    mkdir -p "$DESTINATION_DIR"
fi

# Navigate to the destination directory
cd "$DESTINATION_DIR"

# Use wget to download the file silently (-q)
# The -P flag, if used in the wget command line, can specify the prefix (directory)
# Since we already navigated using 'cd', we just download the file.
wget -q "$DOWNLOAD_URL"

# Check the exit status of the wget command
if [ $? -eq 0 ]; then
    # Get the file name from the URL to confirm the download
    FILE_NAME=$(basename "$DOWNLOAD_URL")
    echo "Download successful! File saved as: $DESTINATION_DIR/$FILE_NAME"
else
    echo "Download failed. Check the URL or network connection."
fi
