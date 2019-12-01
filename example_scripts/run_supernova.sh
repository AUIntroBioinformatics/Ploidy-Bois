#!/bin/bash
module load supernova
supernova run --fastqs=3.2X/3.2X_reads --maxreads='all' --id=32E-1X_assembly --accept-extreme-coverage
