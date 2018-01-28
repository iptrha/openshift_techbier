# Introduction
In this section, we are going to setup the Jenkins Server which will execute our pipeline.

# Installation
```bash
cd 0_infrastructure_setup/scripts
sh install-jenkins.sh
```

# Explanation
This will create an Openshift project ```cicd``` and install Jenkins within. "Ephemeral" means that there will be no persistent data. The data and configurations live only as long as the container is running.
