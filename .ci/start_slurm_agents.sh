#!/bin/bash

. .ci/settings.sh

sudo -u jenkins \
	sbatch -N 1 \
	-export=PATH \
	-o ${SHARED_FS}/jagent-%j-%N-out.txt \
	-e ${SHARED_FS}/jagent-%j-%N-err.txt \
	-p ${PARTITION} \
	-J ${BUILD_TAG} \
	.ci/jagent.slurm ${JENKINS_MASTER_URL} ${BUILD_TAG} ${EXECUTORS}
