#!/bin/bash

export TARGET_REVISION="$1"
export SHORT_COMMIT="$2"
export TAG_NAME="$3"
export FILE="$4"

sed -i "s|targetRevision:\s.*|targetRevision: ${TARGET_REVISION}|g" ${FILE}
sed -i "s|shortCommit:\s.*|shortCommit: ${SHORT_COMMIT}|g" ${FILE}
sed -i "s|tag:\s.*|tag: ${TAG_NAME}|g" ${FILE}
