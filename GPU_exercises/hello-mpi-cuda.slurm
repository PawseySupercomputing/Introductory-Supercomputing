#!/bin/bash -l
#SBATCH --job-name=hello-mpi-cuda
#SBATCH --account=courses03
#SBATCH --reservation=roadshowq
#SBATCH --nodes=2
#SBATCH --gres=gpu:1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module load cuda/6.0.37 mpt

srun -n 2 --ntasks-per-node 2 --export=all --mpi=pmi2 ./hello
