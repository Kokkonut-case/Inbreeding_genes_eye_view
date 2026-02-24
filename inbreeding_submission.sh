#!/bin/bash
#SBATCH --job-name=inbreeding_sim_fine_Z
#SBATCH --array=1-2400
#SBATCH --account=m2_jgu-tee
#SBATCH --time=08:00:00 ## (D-HH:MM:SS)
#SBATCH -p parallel
#SBATCH --constraint=skylake
#SBATCH -c 1
#SBATCH --ramdisk=200Mb
#SBATCH --mail-user=tkeaney@uni-mainz.de
#SBATCH --mail-type=END,FAIL,TIME_LIMIT

## Load a pre-set version of R
module load lang/R

## Grab the appropriate line from the input file.
## Put that in a shell variable named "PARAMS"
export PARAMS=parameters_fine_Z.txt 
## Run R script in batch mode without file output
Rscript hpc_inbreeding_script.R --args $PARAMS $SLURM_ARRAY_TASK_ID 
