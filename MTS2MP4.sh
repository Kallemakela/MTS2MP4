#!/bin/bash

# Function to handle the SIGINT signal (Ctrl+C)
function on_interrupt {
    echo "Aborting the script..."
    exit 1
}

# Set the signal trap to call the on_interrupt function
trap on_interrupt SIGINT

# Load environment variables from .env file in the script's directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/.env"

# Interpret SOURCE_DIR path as relative or absolute based on the "./" prefix
if [[ "$SOURCE_DIR" == "./"* ]]; then
    SOURCE_DIR="$SCRIPT_DIR/${SOURCE_DIR:2}"
fi

# Interpret DESTINATION_DIR path as relative or absolute based on the "./" prefix
if [[ "$DESTINATION_DIR" == "./"* ]]; then
    DESTINATION_DIR="$SCRIPT_DIR/${DESTINATION_DIR:2}"
fi

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' not found!"
    exit 1
fi

# Check if the destination directory exists
if [ ! -d "$DESTINATION_DIR" ]; then
    read -p "Destination directory '$DESTINATION_DIR' not found. Do you want to create it? (y/n): " create_dir
    if [[ $create_dir =~ ^[Yy]$ ]]; then
        mkdir "$DESTINATION_DIR"
    else
        echo "Exiting without conversion."
        exit 1
    fi
fi

for file in "$SOURCE_DIR"/*.MTS; do 
    if [[ ! "$file" =~ /._ ]]; then
        output_file="$DESTINATION_DIR/$(basename "$file" .MTS).mp4"
        echo "Converting $file to $output_file"
        ffmpeg -i "$file" -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 128k "$output_file"
        echo "Conversion complete: $output_file"
    fi
done
