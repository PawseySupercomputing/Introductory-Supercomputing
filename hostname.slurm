#!/bin/bash -l
#SBATCH --job-name=hostname
#SBATCH --account=courses01
#SBATCH --nodes=2
#SBATCH --time=00:05:00
#SBATCH --export=NONE

echo "/bin/hostname"
/bin/hostname

echo "aprun -n -N 8 /bin/hostname"
aprun -n 16 -N 8 /bin/hostname

