#!/usr/bin/env bash

# Script to process unzipped files and build parquet files

# Get local path
localpath=$(pwd)
echo "Local path: $localpath"

# Set download path
rawpath="$localpath/raw"
echo "Raw path: $rawpath"

# Create brick directory
brickpath="$localpath/brick"
echo "Brick path: $brickpath"

# Process raw files and create parquet files in parallel
python ./stages/csv2parquet.py $rawpath $brickpath