# Ploidy Boi's Step 4

## Background
The end goal of almost every genomics pipeline is variant calling, the identification of differences in the sequence, structure, or function either between samples or from a sample to a reference. Variants usually take the form of either single nucleotide variants SNVs (point mutations, insertions, deletions) or structural variants SVs (indels, duplications, inversions, and translocations >50bp). Identification of these variants is usually used in bioinformatic analysis in order to understand patterns and processes in biological systems. For simulation studies such as ours, however, they serve another purpose. By comparing the putatively identified variants with our known simulated variants we can assess the accuracy and effectiveness of bioinformatic tools.

## Tetraploidy
For the tetraploid samples output from Supernova was converted into fasta files with the mkoutput command, using both pseudohaplotype option for pseudoassembly and the raw option for raw reads.    
```supernova mkoutput --style=<assembly strategy> --asmdir=<supernova assembly output directory>/ --outprefix=<output prefix>```    
Reads were then aligned to the reference using BWA      
```bwa mem -M -v 2 -t 4 <reference fasta (indexed)> <reads to align> > <output SAM file>```    
duplicates were marked     
```gatk --java-options "-Xmx1G" MarkDuplicates -R <reference fasta (indexed)>  -I <sorted BAM file> -M <mark duplicates metrics output file> -O <output file>```    
and variants called with GATK.      
```gatk --java-options "-Xmx4G" HaplotypeCaller -R <reference fasta (indexed)> -I <sorted BAM file> --sample-ploidy <ploidy level> -O <output file>```    
Initial fastq outputs from the simulated tetraploid genomes were concerning, varying from 1-20k sequence fragments. This likely indicates highly homologous polyploid genomes can not be assembled de novo with linked read sequence technology. However, reads were successfully mapped to a reference, producing a SAM file. Interestingly, no variants were called from the resulting SAM files. As no variants were simulated from the tetraploid genomes, this result indicates that all reads were successfully mapped back to their original reference point. So, why polyploid linked read sequences may present a challenge to assemble completely de Novo, they may be greatly improved by reference alignment methods.

## SNPs
Variant discovery of simulated single-nucleotide polymorphisms in simulated data can be a fairly straightforward way to verify whether or not your methodology for variant analysis is working. Through utilization of the software, GATK, we were able to analyze how simulation software incorporate randomized SNPs, and whether or not widely-applied variant discovery software is able to identify the total amount of SNPs. Using GATK v4.1, .vcf files were subjected to extraction of SNPs using the software’s HaplotypeCaller. SNPs were there selected for further analysis. Variant filtering was carried out based on 7 criteria, (QD < 2.0, QUAL < 30.0, SOR > 3.0, FS > 60.0, MQ < 40.0, MQRankSum < -12.5, and ReadPosRankSum, < -8.0). Output files were analyzed for variation between 4 samples, 0 SNP, 100 SNP, 10k SNP, and 50k SNP and variation between the three replicates of each simulated genome. 

## Duplications and Inversions

This step uses HaplotypeCaller in GATK to generated a .vcf file for analysis from a merged BAM file. In GATK 4.1, Calls copy-number variants in germline samples given their counts and the corresponding output of DetermineGermlineContigPloidy.  Through utilization of the software, the result indicates that not all reads were successfully mapped back to their original reference point(9 success) by observing all variant filters.Then similar with the procress in snps variant analysis, comparing the results on the variance between 0, 10, 200, 500 duplications and conrresponding replications.
