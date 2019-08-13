import jenkins.model.*
Jenkins jenkins = Jenkins.instance

jenkins.setNumExecutors(2)
jenkins.setSlaveAgentPort(8088)
jenkins.setLabelString("master")
