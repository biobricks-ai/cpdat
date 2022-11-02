#!/usr/bin/env bash

# Script to download files

# Get local [ath]
localpath=$(pwd)
echo "Local path: $localpath"

# Create the list directory to save list of remote files and directories
downloadpath="$localpath/download"
echo "Download path: $downloadpath"
mkdir -p $downloadpath
cd $downloadpath;

# Define the FTP base address
ftplink="https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/CPDat/CPDat2020-12-16/CPDatRelease20201216.zip"

# Download file
wget -P $downloadpath $ftplink --no-check-certificate

echo "Download done."