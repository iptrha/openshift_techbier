#! /bin/bash

while getopts p: option
do
    case "${option}"
    in
    p) PROJECT=${OPTARG};;
    esac
done

if [[ -n "$PROJECT" ]]; then
  echo "Removing Project $PROJECT"
else
  echo "Removing default project helloworld"
  PROJECT=helloworld
fi

oc delete project $PROJECT-devl
oc delete project $PROJECT-test
oc delete project $PROJECT-prod
