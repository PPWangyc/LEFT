#!/bin/bash
#SBATCH -A bcxj-delta-cpu 
#SBATCH --job-name="unzip"
#SBATCH --output="unzip.%j.out"
#SBATCH --partition=cpu
#SBATCH -c 16
#SBATCH --mem 32G
#SBATCH -t 2-00:00:00
#SBATCH --export=ALL

file_path=/work/hdd/bdeu/ywang74/LEFT/data/CLEVR_v1.0.zip
cd /work/hdd/bdeu/ywang74/LEFT/data
unzip $file_path