#!/bin/bash

# Function to compare version numbers
version_gt() {
    test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"
}

# Get the current macOS version
current_version=$(sw_vers -productVersion)

# Get the latest available macOS version
latest_version=$(softwareupdate -l | awk '/\* macOS / {print $2}')

# Check if an update is needed
if version_gt "$latest_version" "$current_version"; then
    echo "Your macOS is outdated. Current version: $current_version, Latest version: $latest_version"
    read -p "Do you want to update? (y/n): " update_choice

    if [ "$update_choice" == "y" ]; then
        echo "Starting the update process..."
        # Add commands to start the update process here
        # For example: softwareupdate -i -a
    else
        echo "No update performed. Exiting."
    fi
else
    echo "Your macOS is up-to-date. Current version: $current_version"
fi
