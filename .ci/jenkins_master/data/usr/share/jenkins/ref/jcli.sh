#!/bin/bash -x
java -jar ${JENKINS_HOME}/war/WEB-INF/jenkins-cli.jar \
	-s ${JENKINS_MASTER_URL} \
	-auth "${JENKINS_USER}:${JENKINS_PASS}" \
	$@
