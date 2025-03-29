#!/bin/bash
#SBATCH -A bcxj-delta-cpu 
#SBATCH --job-name="copy_clevr"
#SBATCH --output="copy_clevr.%j.out"
#SBATCH --partition=cpu
#SBATCH -c 16
#SBATCH --mem 32G
#SBATCH -t 2-00:00:00
#SBATCH --export=ALL

. ~/.bashrc
conda activate left

current_dir=$(pwd)

# source clevr data
source_dir=/work/hdd/bdeu/ywang74/LEFT/data/CLEVR_v1.0/images
target_dir=/work/hdd/bdeu/ywang74/LEFT/data/clevr

# copy images
# copy images from train, val folders to target_dir train, val folders
# copy all images ending with .png to target_dir

echo "Copying images from $source_dir to $target_dir"
echo "Copying val images"
cp $source_dir/val/*.png $target_dir/val/
echo "Copying train images"
cp $source_dir/train/*.png $target_dir/train/











