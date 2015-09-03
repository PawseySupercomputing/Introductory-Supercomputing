#!/bin/bash -l
#SBATCH --job-name=darts-mpi
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

aprun -n 8 -N 8 darts-mpi.x

