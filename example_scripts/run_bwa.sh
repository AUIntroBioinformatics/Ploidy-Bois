#!/bin/bash

#Ploidy (Kyle)
module load bwa
module load samtools
module load gatk/4.1.0.0

bwa mem -M -v 2 -t 4 pseudohaplotypes/pseudoreference.fa 1.6X/1.6X_pseudohap/1.6X_pseudohap.fasta > 1.6X/1.6X_pseudohap/1.6X_pseudohap.sam
samtools view -S -b 1.6X/1.6X_pseudohap/1.6X_pseudohap.sam > 1.6X/1.6X_pseudohap/1.6X_pseudohap.bam
samtools sort 1.6X/1.6X_pseudohap/1.6X_pseudohap.bam -o 1.6X/1.6X_pseudohap/1.6X_pseudohap.sorted.bam
gatk --java-options "-Xmx1G" MarkDuplicates -R pseudohaplotypes/pseudoreference.fa  -I 1.6X/1.6X_pseudohap/1.6X_pseudohap.sorted.bam -M 1.6X/1.6X_pseudohap/1.6X_pseudohap.dup_metrics -O 1.6X/1.6X_pseudohap/1.6X_pseudohap.sorted.markdup.bam


bwa mem -M -v 2 -t 4 pseudohaplotypes/pseudoreference.fa 1.6X/1.6X_raw/1.6X_raw.fasta > 1.6X/1.6X_raw/1.6X_raw.sam
samtools view -S -b 1.6X/1.6X_raw/1.6X_raw.sam > 1.6X/1.6X_raw/1.6X_raw.bam
samtools sort 1.6X/1.6X_raw/1.6X_raw.bam -o 1.6X/1.6X_raw/1.6X_raw.sorted.bam
gatk --java-options "-Xmx1G" MarkDuplicates -R pseudohaplotypes/pseudoreference.fa  -I 1.6X/1.6X_raw/1.6X_raw.sorted.bam -M 1.6X/1.6X_raw/1.6X_raw.dup_metrics -O 1.6X/1.6X_raw/1.6X_raw.sorted.markdup.bam

#SNP (Sarah)
bwa mem Celegans 0SNP_S1_L002_R1_001.fastq 0SNP_S1_L002_R2_001.fastq > 0_1.sam
bwa mem Celegans 0SNP_S2_L002_R1_001.fastq 0SNP_S2_L002_R2_001.fastq > 0_2.sam
bwa mem Celegans 0SNP_S3_L002_R1_001.fastq 0SNP_S3_L002_R2_001.fastq > 0_3.sam
bwa mem Celegans 100SNP_S1_L002_R1_001.fastq 100SNP_S1_L002_R2_001.fastq > 100_1.sam
bwa mem Celegans 100SNP_S2_L002_R1_001.fastq 100SNP_S2_L002_R2_001.fastq > 100_2.sam
bwa mem Celegans 100SNP_S3_L002_R1_001.fastq 100SNP_S3_L002_R2_001.fastq > 100_3.sam
bwa mem Celegans 10kSNP_S1_L002_R1_001.fastq 10kSNP_S1_L002_R2_001.fastq > 10k_1.sam
bwa mem Celegans 10kSNP_S2_L002_R1_001.fastq 10kSNP_S2_L002_R2_001.fastq > 10k_2.sam
bwa mem Celegans 10kSNP_S3_L002_R1_001.fastq 10kSNP_S3_L002_R2_001.fastq > 10k_3.sam
bwa mem Celegans 50kSNP_S1_L002_R1_001.fastq 50kSNP_S1_L002_R2_001.fastq > 50k_1.sam
bwa mem Celegans 50kSNP_S2_L002_R1_001.fastq 50kSNP_S2_L002_R2_001.fastq > 50k_2.sam
bwa mem Celegans 50kSNP_S3_L002_R1_001.fastq 50kSNP_S3_L002_R2_001.fastq > 50k_3.sam
echo "bwa mem completed"
samtools flagstat 0_1.sam >> sam_stat_0.txt
samtools flagstat 0_2.sam >> sam_stat_0.txt
samtools flagstat 0_3.sam >> sam_stat_0.txt
samtools flagstat 100_1.sam >> sam_stat_100.txt
samtools flagstat 100_2.sam >> sam_stat_100.txt
samtools flagstat 100_3.sam >> sam_stat_100.txt
samtools flagstat 10k_1.sam >> sam_stat_10k.txt
samtools flagstat 10k_2.sam >> sam_stat_10k.txt
samtools flagstat 10k_3.sam >> sam_stat_10k.txt
samtools flagstat 50k_1.sam >> sam_stat_50k.txt
samtools flagstat 50k_2.sam >> sam_stat_50k.txt
samtools flagstat 50k_3.sam >> sam_stat_50k.txt
echo "sam stats performed"
mkdir ~/Step_2
mv *stat* ~/Step_2
mv *.sam ~/Step_2
echo "files moved"

#finished



