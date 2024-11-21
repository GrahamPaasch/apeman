#!/usr/bin/env bash

function find_configuration {
    # find_configurations searches the file system to look for a specific configuration

    local base_paths=""
    local directory_depth=5
    local exclude_directories="vendor "
    local exclude_filepaths="CHANGELOG.md "
    local exclude_strings=""
    local filename_patterns=""
    local find_strings="$configuration"
    local file_limit=1

    # Check for package managers and set base_paths accordingly
    if command -v apt-get &> /dev/null; then
        base_paths="/etc/apt /usr/share/doc"
    elif command -v brew &> /dev/null; then
        base_paths="/usr/local/etc /usr/local/Cellar"
    elif command -v composer &> /dev/null; then
        base_paths="/usr/local/bin"
    elif command -v curl &> /dev/null; then
        base_paths="/etc /usr/share"
    elif command -v git &> /dev/null; then
        base_paths="$(git rev-parse --show-toplevel)"
    elif command -v npm &> /dev/null; then
        base_paths="$(npm root -g)"
    elif command -v pecl &> /dev/null; then
        base_paths="/usr/local/lib/php"
    elif command -v pip3 &> /dev/null; then
        base_paths="$(python3 -m site --user-site)"
    elif command -v pipx &> /dev/null; then
        base_paths="$(pipx list | grep location | awk '{print $2}')"
    fi

    # Check if any required variables are empty
    if [[ -z "${base_paths:-}" \
        || -z "${directory_depth:-}" \
        || -z "${exclude_directories:-}" \
        || -z "${exclude_filepaths:-}" \
        || -z "${exclude_strings:-}" \
        || -z "${filename_patterns:-}" \
        || -z "${find_strings:-}" \
        || -z "${file_limit:-}" ]]; then
        return 1
    fi

    # Assuming find_files is a custom function that performs the search
    found_scripts=$(find_files \
        "$base_paths" \
        "$directory_depth" \
        "$exclude_directories" \
        "$exclude_filepaths" \
        "$exclude_strings" \
        "$filename_patterns" \
        "$find_strings" \
        "$file_limit")

    if [[ -n "$found_scripts" ]]; then
        echo "$found_scripts"
        return 0
    else
        return 1
    fi
}