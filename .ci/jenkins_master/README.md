
# Jenkins master server in container (Singularity)

Below are instructions on how to create and run Jenkins master in Singularity
container.

## The Container will include:

1. Jenkins server from latest docker image
1. List of jenkins plugins, as specified in ```data/usr/share/jenkins/ref/plugins.txt```
1. Basic Jenkins setup, as defined by scripts in ```data/usr/share/jenkins/ref/init.groovy.d```
1. SLURM 16.5 client and SLURM SPANK plugins

## How to build and run Jenkins in container

* Run following commands to build container, please note - if you run it from
existing SLURM client machine - container will copy ```/etc/slurm``` and
```/etc/munge``` folder with client config.

```
% cd .ci/jenkins_master
% make build
```

### How to start container service

```
%make start
```

### How to stop container service

```
%make stop
```

### How to get into container instance shell

```
%make shell
```

### How to configure sandbox Jenkins project with Jenkins Job Builder

```
% make jjb
```

### What`s next?

* Connect to the Jenkins URL of the contaner and Build sandbox job
