#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
	echo "2 parameters required, $# provided"
	echo "Usage: $0 <directory> <search_string>"
	exit 1
fi

# Assign the arguments to variables
filesdir=$1
searchstr=$2

# Check if the provided directory exists and is a directory
if [ ! -d "$filesdir" ]; then
	echo "Error: Directory $filesdir does not exist"
	exit 1
fi

# Count the number of files in the directory and its subdirectories
file_count=$(find "$filesdir" -type f | wc -l)

# Count the number of lines that contain the search string
match_count=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the result
echo "The number of files are $file_count and the number of matching lines are $match_count"