# Episode File Renamer

This script renames episode files within season folders, standardizing the naming convention to `SxxEyy` where:
- `Sxx` represents the season number.
- `Eyy` represents the episode number.

The script is designed to work with folders organized alphabetically by season (e.g., `Season 1`, `Season 2`). The new names allow media players and libraries to recognize episodes by season and episode numbers. Initially designed for use with upload files to my personal NAS for the Plex system.

---

## Prerequisites
1. **Ensure your episode files are organized**: 
   - Files must be stored in individual folders for each season (e.g., a `Season 1` folder, a `Season 2` folder).
   - Non-episodic files within the folders should be deleted or temporarily moved to a different location to avoid erroneous file renaming.

2. **Modify the main folder path**:
   - Set the path to the folder containing your season folders or episodes. Modify the line:
     main_folder_path <- "C:/Users/Username/TV/TVShow"
     
   - Replace `"C:/Users/Username/TV/TVShow"` with the path to your main folder for the TV show.

---

## Usage

1. **Set File Type**:
   - The script assumes files are `.mkv`. To change the file type, modify the `extension` variable:
     extension <- ".mkv" # Change file type if needed

2. **Run the Script**:
   - The script automatically detects season folders and sequentially renames each episode file within each folder. If there are no season folders, it labels episodes in the format `S01Eyy` in the main parent folder.

3. **Check Output**:
   - Each file renamed is printed with its new path to confirm successful renaming.

---

## Example Folder Structure

Before running the script:
Breaking Bad/ ├── Season 1/ │ ├── episode1.mkv │ ├── episode2.mp4 │ └── ... ├── Season 2/ │ ├── episode1.mp4 │ ├── episode2.mkv │ └── ... └── Other Files/

After running the script:
Breaking Bad/ ├── S01/ │ ├── S01E01.mkv │ ├── S01E02.mkv │ └── ... ├── S02/ │ ├── S02E01.mkv │ ├── S02E02.mkv │ └── ... └── Other Files/

---

## Important Notes
- **Backup your files**: Rename operations are irreversible. Make sure to keep a backup if unsure of the changes being made.
- **Non-episodic files**: The script does not distinguish between episodic and non-episodic files. Ensure that only episodic files are in each folder.
---

## Disclaimer
Use this script responsibly, and always double-check your files post-renaming to ensure accuracy.
