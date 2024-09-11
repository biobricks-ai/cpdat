import os
import pandas as pd
from pathlib import Path

raw_dir = Path("./raw")
brick_dir = Path("./brick")
brick_dir.mkdir(exist_ok=True)

csv_files = list(raw_dir.glob("*.csv"))

for csv_file in csv_files:
    try:
        df = pd.read_csv(csv_file, encoding='utf-8', low_memory=False)
    except UnicodeDecodeError:
        # If UTF-8 fails, try with 'latin-1' encoding
        df = pd.read_csv(csv_file, encoding='latin-1', low_memory=False)
    
    # Convert problematic columns to string type
    for col in df.columns:
        if df[col].dtype == 'object':
            df[col] = df[col].astype(str)
    
    output_file = brick_dir / f"{csv_file.stem}.parquet"
    df.to_parquet(output_file, index=False)
    print(f"Converted {csv_file.name} to {output_file.name}")


# add a test to read all the parquet files and make sure they all have more than 5 rows
for parquet_file in brick_dir.glob("*.parquet"):
    df = pd.read_parquet(parquet_file)
    assert len(df) > 5, f"File {parquet_file.name} has less than 5 rows"