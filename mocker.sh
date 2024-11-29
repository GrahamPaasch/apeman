#!/bin/bash

# Path to the CSV file
csv_file="qa_tools_spreadsheet.csv"

# Check if the CSV file exists
if [ ! -f "$csv_file" ]; then
    echo "Error: CSV file '$csv_file' not found."
    exit 1
fi

# Create output directory for generated scripts
output_dir="generated_scripts"
mkdir -p "$output_dir"

# Process each line of the CSV (skip the header)
tail -n +2 "$csv_file" | while IFS=',' read -r tool link install_command group contributors; do
    # Skip empty lines
    if [ -z "$tool" ]; then
        continue
    fi

    # Define the output script file
    script_file="$output_dir/$(echo "$tool" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/_/g')_install.sh"

    # Generate the script using a template
    cat <<EOF >"$script_file"
#!/bin/bash

# Tool: $tool
# Repository: $link
# Group: $group
# Contributors: $contributors

# Check if the tool is already installed
if ! command -v $tool &> /dev/null; then
    echo "$tool is not installed. Installing now..."
    # Clone the repository if a link is provided
    if [ ! -z "$link" ]; then
        git clone "$link" /tmp/$tool || { echo "Failed to clone repository."; exit 1; }
    fi

    # Run the installation command
    $install_command || { echo "Installation failed for $tool."; exit 1; }
else
    echo "$tool is already installed."
fi

# Add configuration steps here if required
echo "Configuration for $tool is complete."

# Test installation (optional, replace with actual test command)
echo "Testing $tool installation..."
$tool --help || { echo "Testing $tool failed."; exit 1; }

echo "$tool setup is complete."
EOF

    # Make the generated script executable
    chmod +x "$script_file"

    echo "Generated script for $tool: $script_file"
done

echo "All scripts have been generated in the '$output_dir' directory."
