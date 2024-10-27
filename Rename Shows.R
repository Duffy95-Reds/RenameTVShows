# IMPORTANT: Delete all non-episodic files from the folders first! Or if required remove them to a separate file path and move them back post file name conversion
# Ensure Your episodes are in individual folders for each season and that the seasons are listed in order

# Define the main folder path where the episodes are stored
main_folder_path <- "C:/Users/Username/TV/TVShow"

# Check if there are sub folders (i.e Seasons)
subfolders <- list.dirs(main_folder_path, full.names = TRUE, recursive = FALSE)

# Initialize a counter for the sequential number. This is the numbering for the Seasons
xx <- 01
# Initialize a counter for the sequential number of files. This is the numbering for the Episodes
yy <- 01

extension <- ".mkv" # Enter file type here. File type can be modified.

#Check to see if there are folders for Seasons or just episodes. If there are no folders for seasons files are labelled SxxYyy
if (length(subfolders) == 0) {
  # Get the list of files in the main folder
  files <- list.files(main_folder_path)
  
  # Loop through each file and rename it
  for (file in files) {
    # Construct the new file name with extension
    new_file_name <- sprintf("S%02dE%02d%s", xx, yy, extension)
    
    # Build the full file paths
    old_file_path <- file.path(main_folder_path, file)
    new_file_path <- file.path(main_folder_path, new_file_name)
    
    # Rename the file
    file.rename(old_file_path, new_file_path)
    print(new_file_path)
    
    # Increment the sequential number
    yy <- yy + 1
  }
} else {
  # Loop through each subfolder and rename it
  for (subfolder in subfolders) {
    # Construct the new folder name
    new_folder_name <- sprintf("S%02d", xx)
    
    # Build the new folder path
    new_folder_path <- file.path(main_folder_path, new_folder_name)
    
    # Rename the folder
    file.rename(subfolder, new_folder_path)
    
    # Get the list of files in the renamed folder
    files <- list.files(new_folder_path)
    
    #Restart Episodic Counter at 01 for each new Season
    yy <- 01
    # Loop through each file in the folder and rename it
    for (file in files) {
      # Construct the new file name with extension
      new_file_name <- sprintf("S%02dE%02d%s", xx, yy, extension)
      
      # Build the full file paths
      old_file_path <- file.path(new_folder_path, file)
      new_file_path <- file.path(new_folder_path, new_file_name)
      
      # Rename the file
      file.rename(old_file_path, new_file_path)
      print(new_file_path)
      
      # Increment the sequential number for files
      yy <- yy + 1
    }
    
    # Increment the sequential number for folders
    xx <- xx + 1
  }
}
