#!/bin/bash

#load modules
module load supernova 

#convert supernova output to fasta file under raw assembling strategy (see step 5 for details)
supernova mkoutput --style=raw --asmdir=1.6X/1.6X_assembly/outs/assembly/ --outprefix=1.6X_raw

#convert supernova output to fasta file under pseudohap assembling strategy (see step 5 for details)
supernova mkoutput --style=pseudohap1 --asmdir=1.6X/1.6X_assembly/outs/assembly/ --outprefix=1.6X_pseudohap

