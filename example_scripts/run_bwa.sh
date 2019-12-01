#!/bin/bash

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





