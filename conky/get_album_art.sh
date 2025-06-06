#!/bin/bash

# Grab the URL of the album art via Spotify metadata (Flatpak-friendly)
url=$(playerctl --player=spotify metadata mpris:artUrl | sed 's/^file:\/\///')

# Define output location
output="$HOME/.config/conky/album.jpg"

# If it's a URL, download it
if [[ $url == http* ]]; then
    curl -s "$url" -o "$output"
else
    cp "$url" "$output"
fi
