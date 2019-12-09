#!/bin/bash

#load necessary modules
module load bwa
module load samtools
module load gatk/4.1.0.0

#align supernova assembled fasta sequences to the reference
bwa mem -M -v 2 -t 4 pseudohaplotypes/pseudoreference.fa 1.6X/1.6X_pseudohap/1.6X_pseudohap.fasta > 1.6X/1.6X_pseudohap/1.6X_pseudohap.sam

#convert to SAM format
samtools view -S -b 1.6X/1.6X_pseudohap/1.6X_pseudohap.sam > 1.6X/1.6X_pseudohap/1.6X_pseudohap.bam

#sort
samtools sort 1.6X/1.6X_pseudohap/1.6X_pseudohap.bam -o 1.6X/1.6X_pseudohap/1.6X_pseudohap.sorted.bam

#mark duplicates
gatk --java-options "-Xmx1G" MarkDuplicates -R pseudohaplotypes/pseudoreference.fa  -I 1.6X/1.6X_pseudohap/1.6X_pseudohap.sorted.bam -M 1.6X/1.6X_pseudohap/1.6X_pseudohap.dup_metrics -O 1.6X/1.6X_pseudohap/1.6X_pseudohap.sorted.markdup.bam




