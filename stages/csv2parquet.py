import pandas as pd
import sys
import pyarrow as pyarrow
import fastparquet as fastparquet
from os import path, listdir, mkdir
import shutil

InDirName = sys.argv[1]
OutDirName = sys.argv[2]

#create folder -> parquet split in 1 Gb
try:
    mkdir(OutDirName)
except:
    shutil.rmtree(OutDirName)
    mkdir(OutDirName)

l_files_download = listdir(InDirName)
for file_download in l_files_download:
    if file_download[-3:] == "csv":
        df = pd.read_csv(InDirName + "/" + file_download, encoding='unicode_escape', low_memory=False)
        df.to_parquet("%s/%s.parquet"%(OutDirName, file_download[:-4]))

print(f"csv2parquet: Converting file {InDirName}")
