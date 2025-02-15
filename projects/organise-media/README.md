# PowerShell Media/File Organizer

This PowerShell script organizes files in a source directory based on their creation date (EXIF data for images, "Media created" metadata for videos).  It creates a year/month folder structure in the destination directory and either copies or moves the files.  Files matching specified exclude patterns are skipped.

## Features

* **Copy or Move:** Configurable to either copy or move files.
* **EXIF Data Extraction:** Extracts date information from image files using EXIF data.
* **Video Metadata Extraction:** Extracts "Media created" date from video files.
* **Exclusion Patterns:**  Allows defining patterns to exclude specific files or folders.
* **Year/Month Organization:** Creates a folder structure based on the year and month of the file's creation date.
* **Robust Date Handling:** Attempts to parse dates using the system culture, falling back to the invariant culture if necessary. Includes date cleaning to handle various date formats.
* **Summary Output:** Provides a summary of the operation, including the number of files processed, skipped, and excluded.

## Configuration

The script's behavior is controlled by the `$config` variable at the beginning of the script.  Modify these settings as needed:

```powershell
$config = @{
    source = "D:\source"          # Path to the source directory
    destination = "D:\destination" # Path to the destination directory
    operation = "Copy"           # "Copy" or "Move"
    excludePatterns = @(          # Array of patterns to exclude files/folders
        ".trashed",
        "temp",
        "delete"
        # Add more patterns here
    )
}
