#!/bin/bash -eE

distro=${distro:-"centos7"}
WORKSPACE=${WORKSPACE:-"$PWD"}
ws="${distro}/ws"

topdir=$(git rev-parse --show-toplevel)
cd $topdir


if [ ! -d .git ]; then
	echo "Error: should be run from project root"
	exit 1
fi

source .ci/settings.sh

sudo singularity -qs build  --sandbox $distro .ci/Singularity.$distro
sudo mkdir -p ${ws}
sudo chmod 777 ${ws}

[ -f .git/shallow ] && mv .git/shallow .git/shallow_off
git clone ${WORKSPACE} ${ws} ||:
[ -f .git/shallow_off ] && mv .git/shallow_off .git/shallow
