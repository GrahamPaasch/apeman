#!/usr/bin/env bash

function find_configuration {
    # find_configurations searches the file system to look for a specific configuration

    if apt-get
        local base_paths=""
        local directory_depth=5
        local exclude_directories="vendor "
        local exclude_filepaths="CHANGELOG.md "
        local exclude_strings=""
        local filename_patterns=""
        local find_strings="$configuration"
        local file_limit=1

    if brew
        local base_paths=""
        local directory_depth=5
        local exclude_directories="vendor "
        local exclude_filepaths="CHANGELOG.md "
        local exclude_strings=""
        local filename_patterns=""
        local find_strings="$configuration"
        local file_limit=1

    if composer
        local base_paths=""
        local directory_depth=5
        local exclude_directories=""
        local exclude_filepaths="CHANGELOG.md "
        local exclude_strings=""
        local filename_patterns=""
        local find_strings="$configuration"
        local file_limit=1

    if curl
        local base_paths=""
        local directory_depth=5
        local exclude_directories="vendor "
        local exclude_filepaths="CHANGELOG.md "
        local exclude_strings=""
        local filename_patterns=""
        local find_strings="$configuration"
        local file_limit=1

	if git clone
        local base_paths=""
        local directory_depth=5
        local exclude_directories="vendor "
        local exclude_filepaths="CHANGELOG.md "
        local exclude_strings=""
        local filename_patterns=""
        local find_strings="$configuration"
        local file_limit=1

    if npm
        local base_paths=""
        local directory_depth=5
        local exclude_directories="vendor "
        local exclude_filepaths="CHANGELOG.md "
        local exclude_strings=""
        local filename_patterns=""
        local find_strings="$configuration"
        local file_limit=1

    if pecl
        local base_paths=""
        local directory_depth=5
        local exclude_directories="vendor "
        local exclude_filepaths="CHANGELOG.md "
        local exclude_strings=""
        local filename_patterns=""
        local find_strings="$configuration"
        local file_limit=1

    if pip3
        local base_paths=""
        local directory_depth=5
        local exclude_directories="vendor "
        local exclude_filepaths="CHANGELOG.md "
        local exclude_strings=""
        local filename_patterns=""
        local find_strings="$configuration"
        local file_limit=1

	if pipx
        local base_paths=""
        local directory_depth=5
        local exclude_directories="vendor "
        local exclude_filepaths="CHANGELOG.md "
        local exclude_strings=""
        local filename_patterns=""
        local find_strings="$configuration"
        local file_limit=1

    if [[ -z "${base_paths:-}" \
        || -z "${directory_depth:-}" \
        || -z "${exclude_direcotories:-}" \
        || -z "${exclude_filepaths:-}" \
        || -z "${exclude_strings:-}" \
        || -z "${filename_patterns:-}" \
        || -z "${find_strings:-}" \
        || -z "${file_limit:-}" ]]; then
    return 1
    fi

    found_scripts=$(find_files \
        "$base_paths" \
        "$directory_depth" \
        "$exclude_directories" \
        "$exclude_filepaths" \
        "$exclude_strings" \
        "$filename_patterns" \
        "$find_strings" \
        "$file_limit")

    if [[ -n $configuration_found ]]; then
        return 0
    fi
}