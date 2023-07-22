# MTS to MP4 Converter

## Description

The MTS to MP4 Converter is a simple shell script designed to convert .MTS (AVCHD video format) files to .MP4 format using ffmpeg on macOS. It automates the conversion process and provides options for handling source and destination directories.

## Requirements

- macOS
- ffmpeg (installed via Homebrew)

## Usage

1. Create a file named `.env` in the same directory as the script (`MTS2MP4.command`) and define the SOURCE_DIR and DESTINATION_DIR variables as follows:

   ```ini
   # .env file

   # Specify the source and destination directories
   # Use "./" prefix for relative paths and full path for absolute paths

   # Source directory for .MTS files
   SOURCE_DIR="/CARD/STREAM"

   # Destination directory for converted .MP4 files
   DESTINATION_DIR="./STREAM_MP4"
   ```

2. Run the script by double-clicking the `MTS2MP4.command` or using the following command:

   ```
   ./MTS2MP4.sh
   ```

3. During execution, if you want to abort the script, you can press Ctrl+C to trigger a graceful exit.

## Customization

You can customize the source and destination directories by modifying the SOURCE_DIR and DESTINATION_DIR variables in the `.env` file. The script will interpret SOURCE_DIR and DESTINATION_DIR paths as relative if they start with "./"; otherwise, they will be considered absolute.
