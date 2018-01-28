#! /bin/bash

# Create new Openshift Project
oc new-project build
oc new-project cicd


# Install Jenkins Instance without persistent volume
oc new-app jenkins-ephemeral


oc policy add-role-to-user admin system:serviceaccount:cicd:jenkins -n build
