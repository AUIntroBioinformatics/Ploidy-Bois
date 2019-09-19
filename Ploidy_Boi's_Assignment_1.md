#Ploidy Boi's Assignment 1

##Intro
Quality control is an important first step in any bioinformatic pipeline to identify potential problems with high-throughput sequence output. Failure to appropriately quality control your data can confound further downstream analyses, or worse yet, lead researchers to erroneous conclusions. Here we report the results of a FastQC analysis, a popular software that performs basic quality control checks on high-throughput sequence data. FastQC was run on both the Alabama Supercomputer and Galaxy web platform. 

##Methods
###LRSIM: Simulator for Linked Reads
Before applying quality control,  the whole genome sequencing is simulated by 10X Genomics Linked Read technology. In this project, the simulated read were estimated for compatibility using package “longRanger” and “supernova”. The default parameters are set as the table below containing reference genome and variants, illumina reads characteristics and linkage read parameters. Each member of the group selects a variant to resimulate the sequencing.(Luo n.d.)
FastQC is an application which reads raw sequence data from high throughput sequencers and runs a set of quality checks to produce a report which allows you to quickly assess the overall quality of your run, and to spot any potential problems or biases.

##Results
1,800,000,000 sequences were reported for each of our simulated genomes, with a sequence length of 135-151. Using the reference genome size estimate of 100,286,401 provides an estimate of 2,423X-2,710X coverage. No sequences were filtered by FastQC. Our simulated genomes passed seven quality checks, raised warnings for three, and failed one. Warnings were raised for the per base sequence content test, sequence length distribution test, and Kmer content test. The sequence duplication level test was failed. 
Once genomes were resimulated with 1/100th the number of raw read pairs, estimated coverage was 24X-27X. When FastQC was run again on these genomes, the sequence duplication level test passed (Fig. 1).
![Figure 1](Fig1)
When the same checks were performed on the Galaxy webserver results were the same, however the test scores were not. Notably, the per base sequence content test raised a warning when FastQC was run through the command line but not on Galaxy, even though the results were the same (~18% GC, ~32% AT).
Our sequences maintained a quality score that was above 28 (Fig 2.), therefore we decided against trimming of our simulated reads. 
![Figure 2](Fig2)

##Discussion
The software used for the simulation of experimental genomes was developed for a human genome, a genome that is about 30X the size of our experimental genome. After modulating the simulated reads from 600 million to 6 million, we were able to modify our coverage from 2500X to about 25X. FastQC and Galaxy analysis showed 12 different variations of our genomes (with 3 replicates of each genome), but further steps with this project might require variation on the amount of reads per experimental genome simulation. This would provide a more realistic input for downstream applications.

##Reference
Luo, R. (n.d.). GitHub - aquaskyline/LRSIM: 10x Genomics Reads Simulator. Retrieved September 18, 2019, from https://github.com/aquaskyline/LRSIM
