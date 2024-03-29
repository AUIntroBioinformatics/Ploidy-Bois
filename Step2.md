# Step 2

## Background
In order to produce a contiguous genome sequence from our simulated datasets we used two major methods. Both are designed to work specifically with the barcoded “linked” reads produced by the 10X-Genomics sequencing strategy and both had considerable issues handling our simulated data. Long Ranger is the pipeline designed to be used for reference assembly and includes within it scripts for demultiplexing, de-duplication, filtering, and aligning linked reads in addition to calling and phasing structural variants, SNPs, and indels. However, due to the simulation of the data, we only are able to simulate .fastq files while LongRanger requires .bcl files for their pipeline (bcl2fastq) to correctly work. Therefore, we decided to test the simulated linked-read genomes on Burrows-Wheeler Aligner (BWA) to test how many of our linked reads would align to the reference. The simulated tetraploid genomes, however, have no reference genome and so we turn to the Supernova pipeline for de novo genome assembly. Supernova is designed to assembly, and importantly phase, linked read sequences without a reference genome. 

### Tetraploidy
Supernova requires formatted fastq files, such as those provided by the bcl2fastq software provided by Illumina. In an attempt to reproduce this format forward and reverse reads were partitioned into separate files and renamed following the appropriate conventions. However, when Supernova was executed on these files it returned an error reporting an unacceptable fraction of barcoded reads (0.98% vs. the 80% acceptable minimum). The surprisingly low percentage of barcoded reads indicates an issue with the simulated data. Upon further examination it was revealed the simulation software uses a now deprecated list of barcodes from 2017 that are no longer recognized by the current downstream software provided by 10X Genomics. A list of current acceptable barcodes was found in the source code of the Cell Ranger pipeline and provided to the simulation software (via the -b option flag). However, when the simulation was run with this option it took many times longer to run than originally, and was cancelled after 24hrs, suggesting the custom barcode option of the simulation software may not be functional. After the default barcodes in the simulation software source code were updated Supernova performed as expected. All simulated reads were used in the alignment. As an initial step Supernova estimates genome size and coverage for the De Novo assembly. These initial coverage estimates were much lower than expected (<1X), possibly due to the tetraploid nature of the simulated genome. Consequently the "--accept-extreme-coverage" option was used in order to force Supernova to run.        
```supernova run --fastqs=<directory-containing-reads> --maxreads='all' --id=<run ID> --accept-extreme-coverage```   

### SNPs
The BWA-MEM algorithm is able to align sequences ranging from 70bp-1Mbp, which is why we chose this for our linked reads. This algorithm performs a local alignment using maximal exact matches (MEMs). The reference genome (WBcel235) was indexed using bwa index prior to pair-end sequence alignment.  

### Duplications and Inversion 
#### Table 1. BWA-MEM alignment of duplications and inversions.

Sample | Mapped | Reads Mapped | Mapped to a dif. Chr.
--- | --- | --- | ---
0 DI rp1 | 100% | 4405697  | 2
0 DI rp2 | 100% | 4545572 |  2
0 DI rp3 | 100% | 4545575 |  8
10 DI rp1 | 100% | 4615506 | 8
200 DI rp2 | 100% | 1904714 | 4
200 DI rp3 | 100% | 2709629 | 10
500 DI rp1 | 100% | 1801802 | 8
500 DI rp2 | 100% | 1220234 | 6
500 DI rp3 | 100% | 2960926 | 0

With the tool of BWA-MEM, Here listed 9 resimulated samples (with replication) approved by a mapping rate of 100%. It seems that the number of reads that matched to the chromosome ramdomly. 

## BWA
#### Table 2. BWA-MEM alignment of single-nucleotide polymorphism linked-reads.

Sample | Mapped | Reads Mapped | Mapped to a dif. Chr.
--- | --- | --- | ---
0 SNP rp 1 | 100% | 18000001 | 12
0 SNP rp 2 | 100% | 18000000 | 26
0 SNP rp 3 | 100% | 18000001 | 22
100 SNP rp1 | 100% | 18000002 | 16
10k SNP rp1 | 100% | 18000000 | 10
10k SNP rp2 | 100% | 18000000 | 10
10k SNP rp3 | 100% | 18000001 | 16
50k SNP rp1 | 100% | 18000001 | 14
50k SNP rp2 | 100% | 18000000 | 20
50k SNP rp3 | 100% | 18000001 | 12

Using BWA-MEM saw a mapping rate of 100% throughout all samples and replicates. Interestingly, the number of reads that matched to a different chromosome did not increase corresponding to an increase in SNPs. 
