import jenkins.model.*

def jlc = new jenkins.model.JenkinsLocationConfiguration()
def name = Jenkins.getInstance().getRootUrl()
println("Setting server name to: " + name)
jlc.setUrl(name)
jlc.save()
