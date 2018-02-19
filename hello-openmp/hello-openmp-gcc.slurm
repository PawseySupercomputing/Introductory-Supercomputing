#!/bin/bash -l
#SBATCH --job-name=hello-openmp
#SBATCH --reservation=courseq
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=28
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# set OpenMP environment variables
export OMP_NUM_THREADS=28
export OMP_PLACES=cores
export OMP_PROC_BIND=close

# launch OpenMP program
srun --export=all -n 1 -c ${OMP_NUM_THREADS} ./hello-openmp-gcc
