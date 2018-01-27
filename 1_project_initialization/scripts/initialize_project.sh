#! /bin/bash

while getopts p: option
do
    case "${option}"
    in
    p) PROJECT=${OPTARG};;
    esac
done

if [[ -n "$PROJECT" ]]; then
  echo "Creating Project $PROJECT"
else
  echo "Creating default project demoapp"
  PROJECT=demoapp
fi

oc new-project $PROJECT-devl
oc new-project $PROJECT-test
oc new-project $PROJECT-prod
