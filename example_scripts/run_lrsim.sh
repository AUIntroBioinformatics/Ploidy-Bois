#!/bin/bash
module load lrsim
simulateLinkedReads.pl -x 6 -o -g GCA_000002985.3_WBcel235_genomic_4n.fna -p 4n.6.1 -b barcodes.txt
