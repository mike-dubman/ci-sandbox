#!/bin/bash -eE
cd $(dirname $0)

image="$1"
cmd="$2"

topdir=$(git rev-parse --show-toplevel)
cd $topdir

if [ ! -d .git ]; then
	echo "Error: should be run from project root"
	exit 1
fi

if [ ! -e "$image" ]; then
	echo "Error: no container specified or $image does not exist:"
	exit 2
fi

if [ -z "$cmd" ]; then
	echo "Error: no command provided"
	exit 3
fi

source .ci/settings.sh
singularity exec --writable ${image} "$cmd"
