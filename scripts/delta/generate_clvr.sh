#!/bin/bash

#SBATCH --account=bcxj-delta-gpu
#SBATCH --partition=gpuA40x4
#SBATCH --job-name="generate_clvr"
#SBATCH --output="generate_clvr.%j.out"
#SBATCH -N 1
#SBACTH --array=0
#SBATCH -c 16
#SBATCH --ntasks-per-node=1
#SBATCH --mem 32G
#SBATCH --gpus=1
#SBATCH -t 2-00:00:00
#SBATCH --export=ALL

. ~/.bashrc
conda activate left

current_dir=$(pwd)
cd ../..
echo "Generating CLEVR programs for validation set..."
jac-run scripts/gen-clevr-gt-program.py --input data/clevr/val/questions.json   --output data/clevr/val/questions-ncprogram-gt.pkl

echo "Generating CLEVR programs for training set..."
jac-run scripts/gen-clevr-gt-program.py --input data/clevr/train/questions.json --output data/clevr/train/questions-ncprogram-gt.pkl

cd $current_dir
