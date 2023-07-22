# Specify the source and destination directories
SOURCE_DIR="STREAM"
DESTINATION_DIR="STREAM_MP4"

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
