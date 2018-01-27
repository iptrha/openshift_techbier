#! /bin/bash

oc delete all -l app=jenkins-ephemeral
oc delete sa -l app=jenkins-ephemeral
oc delete rolebinding -l app=jenkins-ephemeral
