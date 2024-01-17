#!/bin/bash

encrypt_file() {
    input_file=$1
    output_file=$2
    recipient=$3

    gpg --encrypt --recipient "$recipient" --output "$output_file" "$input_file"
    echo "$input_file encrypted successfully. Encrypted file saved as $output_file"
}

decrypt_file() {
    input_file=$1
    output_file=$2

    gpg --decrypt --output "$output_file" "$input_file"
    echo "$input_file decrypted successfully. Decrypted file saved as $output_file"
}

main() {
    echo "File Encryption/Decryption using GPG"
    echo "1. Encrypt file"
    echo "2. Decrypt file"

    read -p "Enter your choice (1/2): " choice

    if [ "$choice" == "1" ]; then
        read -p "Enter the path of the file to encrypt: " input_file
        read -p "Enter the path to save the encrypted file: " output_file
        read -p "Enter the GPG recipient (public key email): " recipient
        encrypt_file "$input_file" "$output_file" "$recipient"
    elif [ "$choice" == "2" ]; then
        read -p "Enter the path of the file to decrypt: " input_file
        read -p "Enter the path to save the decrypted file: " output_file
        decrypt_file "$input_file" "$output_file"
    else
        echo "Invalid choice. Please enter 1 or 2."
    fi
}

main