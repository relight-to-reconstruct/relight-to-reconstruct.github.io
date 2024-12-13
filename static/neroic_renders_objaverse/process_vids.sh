#!/bin/bash

for file in *.mp4; do
  # Extract the filename without the extension
  filename="${file%.*}"

  # Create the output file with "_60fps" appended
  output="double_fps/${filename}.mp4"

  # Convert the video
  ffmpeg -i "$file" -filter:v "setpts=0.5*PTS" -r 60 "$output"
  
  echo "Processed: $file -> $output"
done
