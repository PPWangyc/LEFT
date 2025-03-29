#SBATCH --account=bcxj-delta-gpu
#SBATCH --partition=gpuA40x4
#SBATCH --job-name="train_clevr"
#SBATCH --output="train_clevr.%j.out"
#SBATCH -N 1
#SBATCH -c 16
#SBATCH --ntasks-per-node=1
#SBATCH --mem 32G

. ~/.bashrc
conda activate left
current_dir=$(pwd)
cd ../..

jac-crun 0 scripts/trainval-clevr.py --desc experiments/desc_neuro_codex_clevr_learned_belongings.py \
  --data-dir data/clevr/train \
  --data-parses data/clevr/train/questions-ncprogram-gt.pkl data/clevr/val/questions-ncprogram-gt.pkl \
  --curriculum all --expr original --validation-interval 5 --config model.learned_belong_fusion=plus --data-tvsplit 0.95 --data-retain 0.1

cd $current_dir
