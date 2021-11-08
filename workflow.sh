#!/bin/bash

###### Slurm options ####

### Job name
#SBATCH --job-name=ATAC-Seq

### Outputs
#SBATCH --output=ATAC-Seq-%j.out #STDOUT and STDERR

### Requirements
# SBATCH --partition=fast
# SBATCH --nodes=1
# SBATCH --ntasks-per-node
# SBATCH --mem-per-cpus=1GB


### Email
##SBATCH --mail-user=email@adress
##SBATCH--mail-type=ALL


##########################

echo '########################################'
echo 'Date:' $(date --iso-8601=seconds)
echo 'User:' $USER
echo 'Host:' $HOSTNAME
echo 'Job Name:' $SLURM_JOB_NAME
echo 'Job Id:' $SLURM_JOB_ID
echo 'Directory:' $(pwd)
echo '########################################'
echo 'ATAC-Seq version: v0.0.1'
echo '-------------------------'
echo 'Main module versions:'

start0=`date +%s`

# Load modules
module purge
module load conda snakemake/6.5.0 slurm-drmaa
conda --version
python --version
echo 'snakemake' && snakemake --version

echo '-------------------------'
echo 'PATH:'
echo $PATH
echo '-------------------------'

# remove display to make qualimap run:
#unset DISPLAY
#I don't think it's usefull for us

#Actual launching of the pipeline
python main_cluster.py

#Move logs
mkdir -p slurm_output
mv *.out slurm_output

echo '########################################'
echo 'Job Finished' $(date --iso-8601=seconds)
end=`date +%s`
runtime=$((end-start0))
minute=60
echo "---- Total runtime $runtime s ; $((runtime/minute)) min ----"
