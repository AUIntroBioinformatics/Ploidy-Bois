#!/bin/bash

#load modules
module load lrsim

#simulate reads from indexed reference genome, option -b refers to the list of 10X whitelisted barcodes
simulateLinkedReads.pl -x 6 -o -g GCA_000002985.3_WBcel235_genomic_4n.fna -p 4n.6.1 -b barcodes.txt
