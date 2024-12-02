#!/bin/bash

# Path to the CSV file
csv_file="qa_tools_spreadsheet.csv"

# Check if the CSV file exists
if [ ! -f "$csv_file" ]; then
    echo "Error: CSV file '$csv_file' not found."
    exit 1
fi

# Create output directory for generated train track templates
output_dir="prompts"
mkdir -p "$output_dir"

# Path to the station template
station_template="station_template.tt"

# Check if the station template file exists
if [ ! -f "$station_template" ]; then
    echo "Error: Station template file '$station_template' not found."
    exit 1
fi

# Process each line of the CSV (skip the header)
tail -n +2 "$csv_file" | while IFS=',' read -r tool link install_command group contributors; do
    # Skip empty lines
    if [ -z "$tool" ]; then
        continue
    fi

    # Normalize the tool name
    tool=$(echo "$tool" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/_/g')

    # Define the output train track template file
    template_file="$output_dir/${tool}.tt"

    # Replace placeholders in the station template and write the train track file
    sed -e "s/{{TOOL}}/$tool/g" \
        -e "s|{{LINK}}|$link|g" \
        -e "s|{{INSTALL_COMMAND}}|$install_command|g" \
        -e "s|{{GROUP}}|$group|g" \
        -e "s|{{CONTRIBUTORS}}|$contributors|g" \
        "$station_template" > "$template_file"

    echo "Generated train track template for $tool: $template_file"
done

echo "All templates have been generated in the '$output_dir' directory."
