#!/bin/bash

# Specify the Applications folder
applications_folder="/Applications"

# Find the Google Chrome application in the Applications folder but you can add any application you want to use here
chrome_app_path=$(find "$applications_folder" -name "Google Chrome.app" -type d)

if [ -n "$chrome_app_path" ]; then
    # Extract the version number from Info.plist
    version_plist="$chrome_app_path/Contents/Info.plist"
    version=$(defaults read "$version_plist" CFBundleShortVersionString 2>/dev/null)
    
    # Print Google Chrome version
    echo "Google Chrome version: $version"
else
    echo "Google Chrome is not installed on this machine."
fi
