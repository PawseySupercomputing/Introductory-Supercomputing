#!/bin/bash -l
#SBATCH --job-name=hostname
#SBATCH --account=courses03
#SBATCH --reservation=roadshowq
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module load cuda
srun --export=all --mpi=pmi2 -n 1 ./deviceQuery
