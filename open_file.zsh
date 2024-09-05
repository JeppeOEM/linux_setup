#!/bin/zsh
# Find and select a file using fzf
selected_file=$(find . -type f | fzf)

# Check if a file was selected
if [[ -n "$selected_file" ]]; then
    # Determine the MIME type of the selected file
    mime_type=$(file --mime-type -b "$selected_file")


    # Check if the MIME type indicates an image
    if [[ $mime_type == image/* ]]; then
        # Open the file with feh if it is an image
        feh "$selected_file"
    else
        # Otherwise, open the file with nvim
        nvim "$selected_file"
    fi
else
    echo "No file selected."
fi

