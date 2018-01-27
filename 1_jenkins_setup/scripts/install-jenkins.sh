#! /bin/bash

# Create new Openshift Project
oc new-project cicd


# Install Jenkins Instance without persistent volume
oc new-app jenkins-ephemeral
