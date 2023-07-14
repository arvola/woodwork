#!/usr/bin/bash

exiftool -all= -r content
find content -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec mogrify -resize '1920x1080>' {} \;
