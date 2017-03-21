#!/bin/bash -l
#SBATCH --job-name=arch_info
#SBATCH --account=courses03
#SBATCH --reservation=roadshowq
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE
echo "Hostname = $(/bin/hostname)" > arch_mom.out
lscpu >> arch_mom.out

echo "Hostname = $(aprun /bin/hostname)" > arch_compute.out

aprun lscpu >> arch_compute.out
