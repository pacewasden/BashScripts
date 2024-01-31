#!/bin/bash

file_path="example.txt"

# Calculate MD5 hash
md5_hash=$(md5sum "$file_path" | awk '{print $1}')

echo "MD5 hash of $file_path: $md5_hash"
