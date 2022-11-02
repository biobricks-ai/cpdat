#!/usr/bin/env bash

# Script to unzip files

# Get local path
localpath=$(pwd)
echo "Local path: $localpath"

# Set download path
downloadpath="$localpath/download"
echo "Download path: $downloadpath"

# move in the download folder
cd $downloadpath

# Set list path
gzfile=(*)
echo "gz path: $gzfile"

# Unzip file
unzip $downloadpath/$gzfile
echo "Unzip done"

