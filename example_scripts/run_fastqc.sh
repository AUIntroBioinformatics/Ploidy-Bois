#!/bin/bash

#load modules
module load fastqc

#run fastqc on raw simulated fastq reads
fastqc 0.2X/0.2X_reads/config1_concat.fastq
