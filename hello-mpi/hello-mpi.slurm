#!/bin/bash -l
#SBATCH --job-name=hello-mpi
#SBATCH --reservation=courseq
#SBATCH --nodes=1
#SBATCH --tasks-per-node=28
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4GB
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# prepare MPI environment
module load openmpi

# launch MPI program
srun --export=all -N 1 -n 28 ./hello-mpi
