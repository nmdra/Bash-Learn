#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <file_with_filenames>"
  exit 1
fi

file_list="$1"

# Check if the input file exists
if [ ! -f "$file_list" ]; then
  echo "Error: File '$file_list' not found!"
  exit 1
fi

# Using xargs to count lines in each file listed in the input file
echo "Counting lines in each file:"
cat "$file_list" | xargs -I {} wc -l {}

# Using xargs to display the first line of each file
echo -e "\nDisplaying the first line of each file:"
cat "$file_list" | xargs -I {} head -n 1 {}

# Using xargs to copy the files to a backup directory
backup_dir="backup"
mkdir -p "$backup_dir"
echo -e "\nBacking up files to '$backup_dir':"
cat "$file_list" | xargs -I {} cp {} "$backup_dir" && echo "Backup completed."

# Using xargs to delete files (uncomment the line below to enable deletion)
# echo -e "\nDeleting files listed in $file_list:"
# cat "$file_list" | xargs -I {} rm {}

echo -e "\nAll operations completed successfully!"
