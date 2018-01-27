#! /bin/bash

oc project cicd

oc create imagestream s2i-openjdk

oc apply -f ../openshift/buildconfig.yml

oc start-build s2i-openjdk --wait
