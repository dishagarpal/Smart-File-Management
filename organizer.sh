#!/bin/bash

echo "Enter folder path:"
read path

cd "$path" || { echo "Invalid path"; exit 1; }

for file in *; do
    # skip directories
    if [ -f "$file" ]; then

        ext="${file##*.}"

        case "$ext" in
            jpg|png|jpeg)
                folder="Images"
                ;;
            pdf|txt|docx)
                folder="Documents"
                ;;
            mp4)
                folder="Videos"
                ;;
            mp3)
                folder="Music"
                ;;
            c|py|js)
                folder="Code"
                ;;
            *)
                folder="Others"
                ;;
        esac

        mkdir -p "$folder"
        mv "$file" "$folder/"

        echo "Moved $file → $folder"
    fi
done

echo "🎉 Files organized successfully!"