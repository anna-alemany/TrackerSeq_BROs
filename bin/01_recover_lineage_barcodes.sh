#!/bin/bash
# Recovery of reads with trackerseq barcode, plus extraction of corresponding cell barcode and UMI. 
# to run, write in the terminal: 
# ./01_recover_lineage_barcodes.sh name_fastq_file.fq.gz
# The script generates and output file under the name  ${fastq%.f*q.gz}_bc_umi_cell_cnt.tsv

fastq=$1
outcnt=${fastq%.f*q.gz}

zcat $fastq | awk -v bc="CTGA..CTG..ACT..GAC..TGA..CTG..ACT..GAC..GACT" '{
    l=NR%4;
    if (l==1) {
        rn=$0;
        for (j=1; j<=length(rn); j++) {
            rx=substr(rn,j,2)
            if (rx=="RX") {
                umi=substr(rn,j+3,12)
            } else if (rx=="SM") {
                cell=substr(rn,j+3,16)
            }
        }
    } else if (l==2) {
        if ($0 ~ bc) {
            read=$0;
            for (j=1; j<=length(read); j++) {
                rr=substr(read,j,length(bc))
                if (rr ~ bc) {
                    print rr, umi, cell
                }
            }
        }
    }
}' | sort | uniq -c | awk 'BEGIN {OFS="\t"} {print $2,$3,$4,$1}' > ${outcnt}_bc_umi_cell_cnt.tsv
