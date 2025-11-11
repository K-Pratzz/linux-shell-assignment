# Log a header to the file
# Log a header to the file
# PURPOSE: Logs current CPU and memory utilization to a file at regular
#          intervals for system monitoring.
# AUTHOR: Kumari Pratibha 2025
# DATE: 05-11-2025

# Define the log file path
LOG_FILE="./system_monitor.log"

# Define the monitoring interval in seconds
INTERVAL=5

# Set a trap to handle interruption (Ctrl+C) gracefully
trap 'echo -e "\nMonitoring stopped. Results logged to $LOG_FILE"; exit 0' SIGINT

echo "Starting system monitoring. Press Ctrl+C to stop."
echo "Output being logged to $LOG_FILE"

# Log a header to the file
echo "--- System Monitoring Log Started: $(date) ---" >> "$LOG_FILE"
echo "Timestamp,CPU_Usage_%,Mem_Used_MB,Mem_Free_MB" >> "$LOG_FILE"

# Start an infinite loop for continuous monitoring
while true; do
    # Get CPU usage (idle percentage) from 'vmstat'
    # 1. Run vmstat once
    # 2. Skip the header lines (tail -n 1)
    # 3. Extract the 'id' (idle) column (awk '{print $15}')
    # 4. Calculate used CPU percentage (100 - idle)
    CPU_IDLE=$(vmstat 1 2 | tail -n 1 | awk '{print $15}')
    CPU_USED=$((100 - CPU_IDLE))

    # Get memory usage in KB from 'vmstat'
    # Extract 'used' (column 4) and 'free' (column 6) memory fields
    MEM_STATS=$(vmstat 1 2 | tail -n 1 | awk '{print $4 " " $6}')
    MEM_USED_KB=$(echo $MEM_STATS | awk '{print $1}')
    MEM_FREE_KB=$(echo $MEM_STATS | awk '{print $2}')

    # Convert KB to MB for readability (divide by 1024)
    MEM_USED_MB=$((MEM_USED_KB / 1024))
    MEM_FREE_MB=$((MEM_FREE_KB / 1024))

    # Get the current timestamp
    CURRENT_TIME=$(date +%Y-%m-%d_%H:%M:%S)

    # Write the collected data to the log file in CSV format
    echo "$CURRENT_TIME,$CPU_USED,$MEM_USED_MB,$MEM_FREE_MB" >> "$LOG_FILE"

    # Wait for the specified interval before running again
    sleep "$INTERVAL"
done
