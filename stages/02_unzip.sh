#!/usr/bin/env bash

# Script to unzip files

# Get local path
localpath=$(pwd)
echo "Local path: $localpath"

# Set download path
downloadpath="$localpath/download"
echo "Download path: $downloadpath"

# Raw data path
rawpath="$localpath/raw"
mkdir -p $rawpath
echo "Raw path: $downloadpath"

# move in the download folder
cd $downloadpath

# Set list path
gzfile=(*)
echo "gz path: $gzfile"

# Unzip file
unzip $downloadpath/$gzfile -d $rawpath
echo "Unzip done"

