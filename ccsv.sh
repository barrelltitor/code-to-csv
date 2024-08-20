#!/bin/bash

CURRENT_DIRECTORY=$PWD

process(){
    # Output CSV file
    cd "$1"
    output_file="$1.csv"

    # Write the CSV header
    echo "filepath,contents" > "$output_file"

    # Iterate through all files in the current directory and subdirectories
    while IFS= read -r -d '' file; do
        # Get the full file path
        file_path=$(realpath --relative-to="$dir" "$file")
        # Skip the script file itself
        [[ $file == "$dir/test.sh" ]] && continue
        # Get the file contents
        file_contents=$(<"$file")

        # Escape quotes and newlines in the content
        file_contents=$(echo "$file_contents" | sed ':a;N;$!ba;s/\n/\\n/g' | sed 's/"/""/g')

        # Append to the CSV file
        echo "\"$file_path\",\"$file_contents\"" >> "$output_file"
    done < <(find . -type f -print0)

    echo "CSV file created: $output_file"
}

dirs=( $1 )
for dir in "${dirs[@]}"; do
    process "$dir"
    cd "$CURRENT_DIRECTORY"
    mv "$dir/$dir.csv" ./
done
