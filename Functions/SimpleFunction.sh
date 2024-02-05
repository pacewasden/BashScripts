#!/bin/bash

# Function to greet a person
function greet {
    echo "Hello, $1!"
}

# Function to calculate the square of a number
function square {
    local num=$1
    local result=$(( num * num ))
    echo "Square of $num is: $result"
}

# Main script
greet "Pace"
square 5
