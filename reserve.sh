#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <pid> <command>"
    exit 1
fi

PID=$1
COMMAND=$2

# Function to check if a process is running
is_process_running() {
    ps -p $PID > /dev/null 2>&1
}

# Keep checking if the process is running
while is_process_running; do
    sleep 1
done

# Run the command if the process has terminated
eval $COMMAND
