#!/bin/bash

module load fastqc

fastqc 0.2X/0.2X_reads/config1_concat.fastq
fastqc 0.4X/0.4X_reads/config1_concat.fastq
fastqc 0.8X/0.8X_reads/config1_concat.fastq
fastqc 1.6X/1.6X_reads/config1_concat.fastq
