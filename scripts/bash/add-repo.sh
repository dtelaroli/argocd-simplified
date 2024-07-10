#!/bin/bash

export ARGO_PASS=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo "Server: ${ARGO_SERVER} | User: ${ARGO_USER} | Current password: ${ARGO_PASS}"
echo argocd login ${ARGO_SERVER} --username ${ARGO_USER} --password ${ARGO_PASS} --grpc-web
argocd repo add ${REPO_URL} --username=git --password=${GIT_TOKEN} --insecure-skip-server-verification
