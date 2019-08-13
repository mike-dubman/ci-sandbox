#!/bin/bash

# load modules for just in case
if [ -f /etc/profile.d/modules.sh ]; then
	. /etc/profile.d/modules.sh
fi

# setup PATH to various tools used from scripts
module load tools/singularity
module load dev/jdk

# SLURM settings for start_slurm_agents.sh script
export SHARED_FS="/hpc/local/tmp"
export PARTITION="jazz"
export EXECUTORS=4
