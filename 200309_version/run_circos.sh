#!/bin/bash -l
#PBS -l nodes=1:ppn=8,mem=15g,walltime=24:00:00
#PBS -m abe
#PBS -M haasx092@umn.edu
#PBS -e run_circos.err
#PBS -o run_circos.out
#PBS -N run_circos

# Change to proper directory
cd /home/jkimball/haasx092/circos/200309_version

# Load required software (correct versions..this is important!)
module load circos/0.69-6
module load perl/5.26.0

# Launch circos
circos -conf circos.conf
