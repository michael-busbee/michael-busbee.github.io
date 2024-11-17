#!/bin/bash

# Check if message is provided as command line argument
if [ $# -eq 0 ]; then
    # If no argument provided, prompt for input
    echo "Enter your commit message:"
    read commit_message
else
    # Use the command line argument as the commit message
    commit_message="$*"
fi

# Check if the message is empty
if [ -z "$commit_message" ]; then
    echo "Error: Commit message cannot be empty"
    exit 1
fi

# Perform the git commit
git add .
git commit -m "$commit_message"
git push origin main