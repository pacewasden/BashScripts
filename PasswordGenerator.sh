#!/bin/bash

usage() {
    echo "Usage: $0 -l <length> -c <complexity>"
    echo "  -l: Length of the password"
    echo "  -c: Complexity (easy, medium, hard)"
    exit 1
}

generate_password() {
    local length=$1
    local complexity=$2

    case $complexity in
        easy)
            characters="A-Za-z0-9"
            ;;
        medium)
            characters="A-Za-z0-9@#$%^&*"
            ;;
        hard)
            characters="A-Za-z0-9@#$%^&*()-_+=<>?/{}[]|"
            ;;
        *)
            echo "Invalid complexity. Choose from: easy, medium, hard"
            exit 1
            ;;
    esac

    password=$(LC_ALL=C tr -dc "$characters" < /dev/urandom | head -c "$length")
    echo "$password"
}

while getopts "l:c:" opt; do
    case $opt in
        l)
            length=$OPTARG
            ;;
        c)
            complexity=$OPTARG
            ;;
        *)
            usage
            ;;
    esac
done

if [ -z "$length" ] || [ -z "$complexity" ]; then
    usage
fi

password=$(generate_password "$length" "$complexity")
echo "Generated password: $password"
