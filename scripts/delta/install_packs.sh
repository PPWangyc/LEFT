#!/bin/bash
#SBATCH -A bcxj-delta-cpu 
#SBATCH --job-name="install_packs"
#SBATCH --output="install_packs.%j.out"
#SBATCH --partition=cpu
#SBATCH -c 16
#SBATCH --mem 32G
#SBATCH -t 2-00:00:00
#SBATCH --export=ALL

. ~/.bashrc
conda activate left
current_dir=$(pwd)
# install pytorch
echo "Installing pytorch"
conda install pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 cudatoolkit=11.3 -c pytorch --yes 

echo "Installing Concepts"
cd /u/ywang74/Dev/fmri/data/Concepts
pip install -e .
cd $current_dir

echo "Installing opencv-python"
pip install opencv-python

echo "Installing PyYAML"
pip install PyYAML

echo "Installing peewee"
pip install peewee


conda install tensorflow --yes
pip install chardet
pip install Cython