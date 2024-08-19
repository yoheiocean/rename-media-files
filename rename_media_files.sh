#!/bin/bash

# Check if the number of arguments provided is less than 3
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <name_to_precede> <season_number> <directory_path>"
    exit 1
fi

# Change directory to the specified location
cd "$3"

# Initialize a counter
counter=1

# Pad the season number with leading zeros
padded_season=$(printf "%02d" $2)

# Loop through each file in the directory
for file in *; do
    # Check if the current item is a file
    if [ -f "$file" ]; then
        # Extract the file extension
        extension="${file##*.}"
        # Pad the counter with leading zeros
        padded_counter=$(printf "%02d" $counter)
        # Construct the new filename with the name to precede, season number, and episode number
        new_name="$1 S${padded_season}E${padded_counter}.${extension}"
        # Rename the file
        mv "$file" "$new_name"
        # Increment the counter
        ((counter++))
    fi
done
