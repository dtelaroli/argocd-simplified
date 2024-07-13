#!/bin/bash

export TARGET_REVISION=$1
export RELEASE_TAG=$2
export FILE=$3

sed -i "s/targetRevision:\s.*/targetRevision: ${TARGET_REVISION}/g" ${FILE}
sed -i "s/tag:\s.*/tag: ${RELEASE_TAG}/g" ${FILE}
