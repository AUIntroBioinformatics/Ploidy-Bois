# Utility of 3rd Generation Sequencing for Resolving Highly Abnormal Genomes

## Introduction
3rd generation (or single-molecule) sequencing is rapidly gaining in popularity, transforming the resolution at which biological questions can be addressed. By utilizing long-range information 3rd generation sequencing strategies can resolve genotypes that were previously unaccessible, such as highly repetitive or heterogenous genomes. One such strategy is linked read sequencing, as utilized by the Chromium sequencing platform provided by 10X Genomics. this sequencing strategy splits genomic DNA into partitions of only about a dozen molecules each. By sequencing these barcoded partitions together using conventional Illumina short-read sequencing this strategy produces “linked” reads with long-range information. To explore the ability of 3rd generation sequencing to identify abnormal genomic regions we have benchmarked bioinformatic software on simulated linked reads of one of the most popular model organisms for genetic research, C. elegans. Using simulated data allows us to introduce known variants under abnormal conditions.

### Tetraploidy
Sequencing an autopolyploid genome presents several interesting challenges. Foremost, sequencing and assembly strategies must be able to identify haplotypes between two virtually identical copies of each chromosome in order to assemble a complete genome. To see whether or not linked read sequencing can help address this problem we have simulated a tetraploid genome of C. elegans under various coverage levels (3X, 6X, 12X, 24X) to see at what depth (if any) differences between homologous chromosomes become apparent enough to genotype.

### Point Mutations (SNPs)

### Duplications & Inversions

## Methods

### ![Step 1 - simulation and quality assessment](Step1.md)

### ![Step 2 - assembly & alignment](Step2.md)

### Step 3 - post alignment processing 

### ![Step 4 - variant discovery](Step4.md)

### ![Step 5 - synthesis](Step5.md)

#### Contributions
Tetraploidy - KT David
SNPs - SE Martin
Duplication and Inversion - Y Yu
