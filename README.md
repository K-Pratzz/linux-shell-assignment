# linux-shell-assignment
Project Overview
​This repository contains three functional shell scripts developed as part of a Linux System Administration assignment. The scripts demonstrate essential administrative tasks: directory backup, system resource monitoring, and automated file downloading.
​All scripts adhere to best practices, including robust error checking, meaningful variable names, and comprehensive internal and header comments.
Brief Description of Each Script
​a) backup.sh
​Functionality: This script performs a full, recursive copy of a source directory.
​Key Feature: It automatically generates a unique folder name in the destination using the format [DirectoryName]-YYYYMMDD_HHMMSS.
​Error Handling: It includes a check to ensure the source directory exists before attempting the copy operation.
​b) monitor.sh
​Functionality: This script continuously samples system resource usage.
​Key Feature: It uses the vmstat command to capture CPU idle percentage (calculated to usage %) and used/free memory, logging the data to system_monitor.log every 5 seconds.
​Graceful Exit: It includes a trap command to stop monitoring and display the log file location when the user presses CTRL+C.
​c) download.sh
​Functionality: Automates file fetching from the internet.
​Key Feature: Uses the wget utility to download a file from a configured URL. It ensures the destination directory exists, creating it if necessary, before initiating the download.
