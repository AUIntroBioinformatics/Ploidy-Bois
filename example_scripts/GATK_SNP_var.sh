#! /bin/sh

source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load samtools/1.2
module load picard/1.79

#Create Indexes
samtools faidx GCA_000002985.3_WBcel235_genomic.fa
java -Xms2g -Xmx4g -jar /opt/asn/apps/picard_1.79/picard-tools-1.79/CreateSequenceDictionary.jar REFERENCE=GCA_000002985.3_WBcel235_ge\
nomic.fa OUTPUT=GCA_000002985.3_WBcel235_genomic.dict

#load modules needed for this job
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load gatk/4.1.0.0
source activate gatk

#Simulated genomes do not contain read groups, they can be added with the following command
java -Xms2g -Xmx4g -jar /opt/asn/apps/picard_1.79/picard-tools-1.79/AddOrReplaceReadGroups.jar I=10k_1.bam O=10k_rg.bam RGLB=lib1 RGPL\
=illumina RGPU=unit1 RGSM=ILoveYou
###VARIABLES######
ref="GCA_000002985.3_WBcel235_genomic.fa"
sample="sample file here"
#####

gatk --java-options "-Xmx1G" BuildBamIndex -I $sample.bam -R $ref
#Simulated genomes should not have PCR duplicates!
#gatk --java-options "-Xmx1G" MarkDuplicates -R $ref -I $sample.bam -M $sample.dup_metrics -O $sample.markdup.bam

#Build Bam Index
gatk --java-options "-Xmx1G" BuildBamIndex -I sample.bam -R $ref
#Short Variant Discovery
gatk --java-options "-Xmx4G" HaplotypeCaller -R $ref -I $sample.bam --sample-ploidy 2 -O $sample.g.vcf.gz

#Joint Genotyping
gatk --java-options "-Xmx4G" GenotypeGVCFs -R $ref -V $sample.g.vcf.gz -O $sample.vcf.gz

#Extract only SNPs
gatk SelectVariants -R $ref --variant $sample.vcf.gz --select-type-to-include SNP --output $sample.SNPs.vcf

#Perform variant filtering
gatk VariantFiltration -R $ref --variant $sample.SNPs.vcf \
--filter-expression "QD < 2.0" --filter-name "QD2" \
--filter-expression "QUAL < 30.0" --filter-name "QUAL30" \
--filter-expression "SOR > 3.0" --filter-name "SOR3" \
--filter-expression "FS > 60.0" --filter-name "FS60" \
--filter-expression "MQ < 40.0" --filter-name "MQ40" \
--filter-expression "MQRankSum < -12.5" --filter-name "MQRankSum-12.5" \
--filter-expression "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8" \
--output $sample.SNPs.filtered.vcf

source deactivate gatk
