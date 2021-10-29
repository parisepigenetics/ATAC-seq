#!bin/bash

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
echo 'RASflow_IFB version: v0.5.3'
echo '-------------------------'
echo 'Main module versions:'
