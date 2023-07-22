# MTS to MP4 Converter

## Description

The MTS to MP4 Converter is a simple shell script designed to convert .MTS (AVCHD video format) files to .MP4 format using ffmpeg on macOS. It automates the conversion process and provides options for handling source and destination directories.

## Requirements

- macOS
- ffmpeg (installed via Homebrew)

## Installation

1. Make sure you have Homebrew installed on your macOS system. If not, you can install it by following the instructions at https://brew.sh/

2. Open Terminal on your macOS system.

3. Install ffmpeg using Homebrew by executing the following command:
   ```
   brew install ffmpeg
   ```

## Usage

0. Specify the source and destination directories in the script. You can change these by modifying the following lines in the script:

```bash
# Specify the source and destination directories
SOURCE_DIR="STREAM"
DESTINATION_DIR="STREAM_MP4"
```

1. Place all the .MTS files you want to convert in the source directory (default: "STREAM").

2. Open Terminal on your macOS system.

3. Navigate to the directory containing the script.

4. Run the script using the following command:
   ```
   bash mts_to_mp4_converter.sh
   ```

5. The script will check if the source directory exists and if the destination directory exists. If the source directory is not found, it will raise an error and exit. If the destination directory is not found, it will ask if you want to create it.

6. The script will then proceed to convert all .MTS files in the source directory to .MP4 files in the destination directory.

7. The converted .MP4 files will be saved in the destination directory (default: "STREAM_MP4") with the same filenames as the original .MTS files.

You can customize the source and destination directories by modifying the variables `SOURCE_DIR` and `DESTINATION_DIR` in the script.


