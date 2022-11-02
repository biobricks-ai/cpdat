# Chemical and Products Database (CPDAT)
CPDat (Chemical and Products Database) is a database containing information mapping more than 49,000 chemicals to a set of terms categorizing their usage or function in 16,000 consumer products (e.g. shampoo, soap) types based on what chemicals they contain. The database is a part of EPA's Computational Toxicology (CompTox) Dashboard and contains data from other EPA databases including CPCat, CPCPdb and FUse. CPDat also contains data from non-targeted analysis of chemicals performed on different consumer products and from new product composition data that is publicly available.

For chemicals without a weight fraction in a given product, EPA scientists developed a model that generates a predicted weight based on its placement in the ingredients list. 

Users can search the CompTox Dashboard for chemicals by chemical name, Chemical Abstracts Registry Number (CASRN), or by a product type (e.g. "shampoo"). 

URL: https://epa.figshare.com/articles/dataset/The_Chemical_and_Products_Database_CPDat_MySQL_Data_File/5352997



# How to build bricks

1. Create a brick named `{newbrick}` from this template
```
gh repo create biobricks-ai/{newbrick} -p biobricks-ai/brick-template --public
gh repo clone biobricks-ai/{newbrick}
cd newbrick
```

2. Edit stages according to your needs:
    Recommended scripts:
    - ``01_download.sh``
    - ``02_unzip.sh``
    - ``03_build.sh`` calling a function to process individual files like ``csv2parquet.R`` or ``csv2parquet.py``

3. Replace stages in dvc.yaml with your new stages
    
4. Build your brick
```
dvc repro # runs new stages
```

5. Push the data to biobricks.ai
```
dvc push -r s3.biobricks.ai 
```

6. Commit the brick
```
git add -A && git commit -m "some message"
git push
```

7. Monitor the bricktools github action

