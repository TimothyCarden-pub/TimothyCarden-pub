#!/bin/bash

# Define the CSV file path
csv_file="user_info.csv"

# Define the questions
questions=("What is your name?" "What is your age?" "What is your gender?" "What is your occupation?" "What is your favorite color?")

# Ask the questions and save the answers to an array
for question in "${questions[@]}"
do
    echo "$question"
    read -r answer
    answers+=("$answer")
done

# Save the answers to the CSV file
echo "${answers[*]}" >> "$csv_file"

# Print a message to confirm the save
echo "User info saved to $csv_file."
