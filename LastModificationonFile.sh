# Checks to see the last time a file was modified

file="/path/to/your/file.txt"
current_date=$(date +"%Y-%m-%d")
file_date=$(date -r "$file" +"%Y-%m-%d")

if [ "$current_date" == "$file_date" ]; then
    echo "File was modified today."
else
    echo "File was not modified today."
fi
