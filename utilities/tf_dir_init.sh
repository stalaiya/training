#!/bin/bash

# Function to create the necessary directories and files
create_terraform_structure() {
    local project_name=$1
    shift  # Remove the first argument (project name) from the arguments list
    modules=("$@")  # The remaining arguments are the module names

    project_dir="$HOME/Desktop/github/training/AWS/${project_name}"

    # Create the main Terraform directory structure
    mkdir -p "${project_dir}/terraform"
    touch "${project_dir}/terraform/main.tf"
    touch "${project_dir}/terraform/variables.tf"
    touch "${project_dir}/terraform/outputs.tf"
    touch "${project_dir}/terraform/terraform.tfvars"
    mkdir -p "${project_dir}/terraform/modules"

    # Create the module directories and files
    for module in "${modules[@]}"; do
        mkdir -p "${project_dir}/terraform/modules/${module}"
        touch "${project_dir}/terraform/modules/${module}/main.tf"
        touch "${project_dir}/terraform/modules/${module}/variables.tf"
        touch "${project_dir}/terraform/modules/${module}/outputs.tf"
    done
}

# Check if at least one argument is provided (the project name)
if [ $# -lt 1 ]; then
    echo "Usage: $0 <project_name> [module1] [module2] [...]"
    exit 1
fi

# Extract the project name and module names from the arguments
project_name=$1
shift  # Remove the first argument (script name) from the arguments list
modules=("$@")  # The remaining arguments are the module names

# Call the function to create the Terraform directory structure
create_terraform_structure "$project_name" "${modules[@]}"

echo "Terraform directory structure created successfully under ${project_name} with modules: ${modules[*]}"