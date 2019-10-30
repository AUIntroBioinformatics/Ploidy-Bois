#Ploidy Boi's Assignment 1

Kyle David, Sarah Martin, and Yan Yu

##Methods
###SNPed genomes
Variant discovery of simulated single-nucleotide polymorphisms in simulated data can be a fairly straightforward way to verify whether or not your methodology for variant analysis is working. Through utilization of the software, GATK, we were able to analyze how simulation software incorporate randomized SNPs, and whether or not widely-applied variant discovery software is able to identify the total amount of SNPs. Using GATK v4.1, .vcf files were subjected to extraction of SNPs using the software’s HaplotypeCaller. SNPs were there selected for further analysis. Variant filtering was carried out based on 7 criteria, (QD < 2.0, QUAL < 30.0, SOR > 3.0, FS > 60.0, MQ < 40.0, MQRankSum < -12.5, and ReadPosRankSum, < -8.0). Output files were analyzed through IGV variant viewer in order to visualize the sites of variation between 4 samples, 0 SNP, 100 SNP, 10k SNP, and 50 SNP. 
###Duplicated genomes
	For the tetraploid samples output from Supernova was converted into fasta files with the mkoutput command, using the pseudohaplotype option. Reads were then aligned to the reference using BWA, duplicated were marked and variants called with GATK.

##Results + Discussion
###SNPed genomes
Upon failure to discover any variant sites within SNP variable simulated data sets, further analysis is required. Does GATK filter out all of these sites? Why would that happen?
###Duplicated Genomes
	Initial fastq outputs from the simulated tetraploid genomes were concerning, varying from 1-20k sequence fragments. This likely indicates highly homologous polyploid genomes can not be assembled de novo with linked read sequence technology. However, reads were successfully mapped to a reference, producing a SAM file. Controversially, no variants were successfully called. No variants were simulated from the reference so at face value this is excellent news, however I would have expected at least some variant calls due to imperfections in the alignment. Further investigation is required, perhaps through manipulation of filtering parameters. 	
