#!/bin/bash -l

MASTER="$1"
LABELS="$2"
EXECUTORS="$3"

SCRAP=/tmp/jenkins/${SLURM_JOBID}

mkdir -p ${SCRAP}
cd ${SCRAP}

set -x
rm -f swarm-client.jar
wget -np ${MASTER}/swarm/swarm-client.jar
java \
	-Duser.home=${SCRAP} \
	-jar swarm-client.jar \
	-fsroot=${SCRAP} \
	-master ${MASTER} \
	-username jenkins \
	-password jenkins \
	-executors ${EXECUTORS} \
	-labels "${LABELS}"
