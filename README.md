# TrackerSeq_BROs
Analysis of trackerseq data in Brain Organoids

In this repository, you will find: 
- source code (python notebooks). This code has been tested only in UNIX (under Mac... operating system - include version number)
- A real dataset to demo the code

# Manual
Detailed instructions. Expected output. Expected run time for a demo on a ``normal'' desktop computer. 
1) preparation of fastq file
This can take a whole day in a normal computer. It is recommended to access an HPC to manipulate fastq files. 
``` 
./01_concatenator.py --fqf 202201213_nested_lineage_20_L004 --lencbc 16 --lenumi 12 --cbcfile barcodes_10x-cellranger.tsv
```
2) clonal barcode retrieval form fastq file
```
./02_recover_lineage_barcodes.sh cbc_fastq.fastq.gz
```
3) Python Notebook


## Extra information
### System requirements
python3 + ... packages => All available using Anaconda
No extra installation is required. 
