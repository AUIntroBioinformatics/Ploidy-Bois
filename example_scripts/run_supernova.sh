#!/bin/bash

#load modules
module load supernova

#run supernova de novo assembly pipeline on simualted reads, accept-exteme-coverage option necessary to polyploid genomes due to issues with the estimated genome size provided by supernova
supernova run --fastqs=3.2X/3.2X_reads --maxreads='all' --id=32E-1X_assembly --accept-extreme-coverage
