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
  echo "Creating default project helloworld"
  PROJECT=helloworld
fi

# Create the necessary Openshift Projects
oc new-project $PROJECT-devl
oc new-project $PROJECT-test
oc new-project $PROJECT-prod

# Grant the right to pull images from the build project
oc policy add-role-to-group system:image-puller system:serviceaccounts:$PROJECT-devl -n build
oc policy add-role-to-group system:image-puller system:serviceaccounts:$PROJECT-test -n build
oc policy add-role-to-group system:image-puller system:serviceaccounts:$PROJECT-prod -n build

oc policy add-role-to-user admin system:serviceaccount:cicd:jenkins -n $PROJECT-devl
oc policy add-role-to-user admin system:serviceaccount:cicd:jenkins -n $PROJECT-test
oc policy add-role-to-user admin system:serviceaccount:cicd:jenkins -n $PROJECT-prod
