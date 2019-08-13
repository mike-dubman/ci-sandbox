## CI with Jenkins and SWARM agents over SLURM cluster

### This demo project implements following concepts:

1. Use Jenkins pipeline CI/CD for "autotools based" helloworld C project
1. Use containers to wrap pipeline business logic for portability with other CI`s like AzureCI etc, reproducibility and ease.
   - Played with Docker and Singularity, both worked fine.
   - Selected singularity as it can be run as non-root user and when used from SLURM - it inherits user specific cgroups limits.
1. Use jenkins agent swarm (https://wiki.jenkins.io/display/JENKINS/Swarm+Plugin) plugin, activated on-demand as a code from project pipeline (alternative to static/permanent jenkins agents)
1. Use SLURM (https://slurm.schedmd.com) based clusters to generate/start/stop jenkins agents on-demand
   1. Use Jenkins-Job-Builder (https://docs.openstack.org/infra/jenkins-job-builder/) to generate Jenkins job from cli interface (Jenkins-as-code)
1. Illustrate best practices for CI pipeline:
   - Put business logic code into external scripts and call them from pipeline stages/steps
   - Package project source code into container and run all build/test logic from whithing container (also can map workspace folder with source into container as an alternative)
   
 ### How to run demo
 
 1. Install Jenkins job builder and load project into Jenkins server (Jenkins should have swarm and pipeline plugins installed, also slurm client installed on the master)
    - To load sandbox project into Jenkins, run: ```jenkins-jobs update .ci/sandbox.jjb```
 1. ```Jenkinsfile``` and all CI related files can be found in ```.ci/``` folder
 1. SLURM integration is illustrated inside Jenkinsfile, search for function ```startSlurmAgent, stopSlurmAgent```
 1. Check ```.ci/settings.sh``` file to adopt ```PATH``` to local site specifics
 1. Check ```.ci/jenkins_master/``` folder for Jenkins master with SLURM in a container
 
 
 have fun!
