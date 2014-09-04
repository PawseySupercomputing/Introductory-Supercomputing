#!/bin/bash -l
#SBATCH --job-name=hostname
#SBATCH --account=courses01
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=16
#SBATCH --time=00:05:00
#SBATCH --export=NONE

echo "/bin/hostname"
/bin/hostname

echo "aprun -B /bin/hostname"
aprun -B /bin/hostname

