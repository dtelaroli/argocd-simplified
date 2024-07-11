#!/bin/bash

if [ -z "${ARGO_USER}" ]; then
  export ARGO_USER=admin 
fi

if [ -n "$1" ]; then
    export ARGO_SERVER=$1
else
    echo 'Type the argocd server:'
    read ARGO_SERVER
fi

if [ -n "$2" ]; then
    export REPO_URL=$3
else
    echo 'Type the new repository url:'
    read REPO_URL
fi

if [ -n "$3" ]; then
    export GIT_TOKEN=$3
else
    echo 'Type the git token:'
    read GIT_TOKEN
fi

export ARGO_PASS=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo "Server: ${ARGO_SERVER} | User: ${ARGO_USER} | Current password: ${ARGO_PASS}"
echo argocd login ${ARGO_SERVER} --username ${ARGO_USER} --password ${ARGO_PASS} --grpc-web
argocd repo add ${REPO_URL} --username=git --password=${GIT_TOKEN} --insecure-skip-server-verification
