# Step 3

## Intro
After aligning the simulated genomes with varying single nucleotide polymorphisms (SNPs), GATK was using in order to look at where the simulation software would introduce these SNPs. VCF files were generated as an overview and were filtered using default conditions. 

Due to issues with the simulation software new tetraploid genomes were simulated that do (appear) to work with the 10X genomics Supernova pipeline for de novo assembly. Here we report initial results from several Supernova runs and discuss next steps.

## Methods
### Tetraploidy
Due to considerable issues with the simulated tetraploid genomes for de novo simulation we were forced to start from scratch. A new “reference” was cobbled together from previously published chromosome level C. elegans assemblies. Two different wild-type strains were used to represent the parental genotypes and two different assemblies were used for each strain to represent the two different copies, for a total of four sub-genomes representing a phased tetraploid reference genome. The two strains were N2 (assemblies GCA_000002985.3_WBcel235 & UNSB01) and CB4856 (assemblies GCA_000975215.1_Cael_CB4856_1.0 & GCA_004526295.1_ASM452629v1). This mock reference was used to simulate under the software SIMLR. Three different simulations were performed under the standard SIMLR parameters save for the short read coverage parameter which was changed to 0.2x (the default), 0.4x, and 0.8x. The resulting fastq files were used as input for Supernova assemblies which (finally) ran without errors. 
### SNPs 
Post-alignment files were converted to .bam files, and underwent read group supplementation. Apparently, GATK refuses to tell the user that files will not run without included read groups and the simulated software apparently does not include these read groups. Therefore, random read groups were included to the SNP genomes using AddorReplaceReadGroups.jar in the Picard module. Then, GATK was used to build bam indexes, provide joint genotyping, extracted SNPs, and filtered through variant selection. 
### Duplications and Inversion 

## Results & Discussion
Despite the simulator including SNPs, there does not appear to result in any SNPs that GATK can identify. All samples (0, 100, 10k, and 50k) did not find any variants (figure 1.) Through imaging through IGV, it is very clear that there are no variants due to their helpful and blatant observation. 

The output from Supernova, while absent of error, indicates that simulations were performed under suboptimal conditions. None of the simulations recovered the expected genome size and all had lower coverage outside the 38x-56x range preferred by Supernova (Table X). These initial results indicate these datasets are not complete and not likely to recover good results with GATK. We are currently in the process of running more simulations with increasingly higher coverage parameters that will hopefully be more appropriate for downstream analysis.


#### Table 1.
short read coverage param. | estimated raw coverage | estimated genome size
--- | --- | --- 
0.8 | 22.81 | 104.54 Mb 
0.4 | 12.43 | 87.71 Mb
0.2 | 11.72 | 49.63 Mb

