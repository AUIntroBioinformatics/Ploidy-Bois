#!/bin/bash

#For separating out forward and reverse reads from simulated .fastq files

##Separating out forward reads
#awk '{if(NR%8  >= 1 && NR%8 < 5) print}' file.fastq > file_R1.fastq

awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 0SNP_S1_L001_R1_001.fastq > 0SNP_S1_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 0SNP_S2_L001_R1_001.fastq > 0SNP_S2_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 0SNP_S3_L001_R1_001.fastq > 0SNP_S3_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 100SNP_S1_L001_R1_001.fastq > 100SNP_S1_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 100SNP_S1_L001_R1_001.fastq > 100SNP_S2_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 100SNP_S2_L001_R1_001.fastq > 100SNP_S3_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 10kSNP_S3_L001_R1_001.fastq > 10kSNP_S1_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 10kSNP_S2_L001_R1_001.fastq > 10kSNP_S2_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 10kSNP_S3_L001_R1_001.fastq > 10kSNP_S3_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 50kSNP_S1_L001_R1_001.fastq > 50kSNP_S1_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 50kSNP_S2_L001_R1_001.fastq > 50kSNP_S2_L002_R1_001.fastq
awk '{if(NR%8  >= 1 && NR%8 < 5) print}' 50kSNP_S3_L001_R1_001.fastq > 50kSNP_S3_L002_R1_001.fastq
echo "Foward complete :)"
mkdir For_Rev_Reads
echo "directory made :)"
##Separatomg out reverse reads
#awk '{if(NR%8 == 0 || NR%8 >= 5) print}' file.fastq > file_R2.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 0SNP_S1_L001_R1_001.fastq > 0SNP_S1_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 0SNP_S2_L001_R1_001.fastq > 0SNP_S2_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 0SNP_S3_L001_R1_001.fastq > 0SNP_S3_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 100SNP_S1_L001_R1_001.fastq > 100SNP_S1_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 100SNP_S2_L001_R1_001.fastq > 100SNP_S2_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 100SNP_S3_L001_R1_001.fastq > 100SNP_S3_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 10kSNP_S1_L001_R1_001.fastq > 10kSNP_S1_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 10kSNP_S2_L001_R1_001.fastq > 10kSNP_S2_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 10kSNP_S3_L001_R1_001.fastq > 10kSNP_S3_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 50kSNP_S1_L001_R1_001.fastq > 50kSNP_S1_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 50kSNP_S2_L001_R1_001.fastq > 50kSNP_S2_L002_R2_001.fastq
awk '{if(NR%8 == 0 || NR%8 >= 5) print}' 50kSNP_S3_L001_R1_001.fastq > 50kSNP_S3_L002_R2_001.fastq
echo "Reverse complete :)"
mv *L002* For_Rev_Reads
echo "reads moved :)"

wc -l 0SNP_S1_L002_R1_001.fastq > linecount.txt
wc -l 0SNP_S1_L002_R2_001.fastq >> linecount.txt
wc -l 0SNP_S2_L002_R1_001.fastq >> linecount.txt
wc -l 0SNP_S2_L002_R2_001.fastq >> linecount.txt
wc -l 0SNP_S3_L002_R1_001.fastq >> linecount.txt
wc -l 0SNP_S3_L002_R2_001.fastq >> linecount.txt
wc -l 100SNP_S1_L002_R1_001.fastq >> linecount.txt
wc -l 100SNP_S1_L002_R2_001.fastq >> linecount.txt
wc -l 100SNP_S2_L002_R1_001.fastq >> linecount.txt
wc -l 100SNP_S2_L002_R2_001.fastq >> linecount.txt
wc -l 100SNP_S3_L002_R1_001.fastq >> linecount.txt
wc -l 100SNP_S3_L002_R2_001.fastq >> linecount.txt
wc -l 10kSNP_S1_L002_R1_001.fastq >> linecount.txt
wc -l 10kSNP_S1_L002_R2_001.fastq >> linecount.txt
wc -l 10kSNP_S2_L002_R1_001.fastq >> linecount.txt
wc -l 10kSNP_S2_L002_R2_001.fastq >> linecount.txt
wc -l 10kSNP_S3_L002_R1_001.fastq >> linecount.txt
wc -l 10kSNP_S3_L002_R2_001.fastq >> linecount.txt
wc -l 50kSNP_S1_L002_R1_001.fastq >> linecount.txt
wc -l 50kSNP_S1_L002_R2_001.fastq >> linecount.txt
wc -l 50kSNP_S2_L002_R1_001.fastq >> linecount.txt
wc -l 50kSNP_S2_L002_R2_001.fastq >> linecount.txt
wc -l 50kSNP_S3_L002_R1_001.fastq >> linecount.txt
wc -l 50kSNP_S3_L002_R2_001.fastq >> linecount.txt
