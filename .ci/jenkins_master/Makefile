APPNAME=myjenkins
DEF_FILE=$(APPNAME).def
SIF_FILE=$(APPNAME).sif
OPT=

build:
	sudo singularity build $(OPT) -F $(SIF_FILE) $(DEF_FILE)

stop:
	sudo singularity instance stop $(APPNAME)

start:
	sudo -E singularity -d instance start --net --network-args "portmap=8070:8080/tcp" --network-args "portmap=8088:8088/tcp" --writable-tmpfs $(SIF_FILE) $(APPNAME)

all: build stop start

shell: bash
bash:
	sudo singularity shell instance://$(APPNAME)

jjb:
	sudo singularity exec instance://$(APPNAME) sudo -u jenkins jenkins-jobs update /etc/jenkins_jobs/jobs/sandbox.jjb

trigger: trigger-job
trigger-job:
	sudo singularity exec instance://$(APPNAME) /usr/share/jenkins/ref/jcli.sh build sandbox-pipeline-pr
clean:
	rm -f $(APPNAME).sif
