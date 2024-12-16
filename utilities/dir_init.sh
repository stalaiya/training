#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <parent-directory-name>"
  exit 1
fi

# Assign the first argument to a variable
PARENT_DIR="$HOME/Desktop/github/training/AWS/$1"

# Create the parent directory
mkdir -p "$PARENT_DIR"

# List of directories to create
DIRECTORIES=("cloudFormation" "cost" "design" "input" "logs" "output" "scripts" "terraform")

# Loop through the list and create each directory under the parent directory
for dir in "${DIRECTORIES[@]}"; do
  mkdir -p "$PARENT_DIR/$dir"
done

# Initialize Terraform in the terraform directory
if [ -d "$PARENT_DIR/terraform" ]; then
  cd "$PARENT_DIR/terraform" || exit
  terraform init
else
  echo "Terraform directory does not exist."
fi