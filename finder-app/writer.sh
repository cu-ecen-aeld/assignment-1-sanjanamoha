#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Invalid number of arguments."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Assign arguments to variables
writefile=$1
writestr=$2

# Extract the directory path from the provided file path
writedir=$(dirname "$writefile")

# Create the directory if it doesn't exist
mkdir -p "$writedir"
if [ $? -ne 0 ]; then
    echo "Error: Could not create directory $writedir"
    exit 1
fi

# Write the string to the file, overwriting it if it exists
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not write to file $writefile"
    exit 1
fi

# Success message (optional)
echo "Successfully wrote to $writefile"
