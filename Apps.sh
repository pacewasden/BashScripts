#!/bin/bash

# Specify the Applications folder
applications_folder="/Applications"

# Use find to locate .app directories in the Applications folder
find "$applications_folder" -name "*.app" -type d | while read -r app_path; do
    # Extract application name
    app_name=$(basename "$app_path" | sed 's/\.app$//')

    # Extract version number (if available)
    version_plist="$app_path/Contents/Info.plist"
    version=$(defaults read "$version_plist" CFBundleShortVersionString 2>/dev/null)

    # Print application name and version
    echo "$app_name : $version ,"
done
