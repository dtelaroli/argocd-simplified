#!/bin/bash

export TARGET_REVISION="$1"
export SHORT_COMMIT="$2"
export TAG_NAME="$3"
export FILE="$4"

sed -i '' "s|targetRevision:.*|targetRevision: ${TARGET_REVISION}|g" ${FILE}
sed -i '' "s|shortCommit:.*|shortCommit: ${SHORT_COMMIT}|g" ${FILE}
sed -i '' "s|tag:.*|tag: ${TAG_NAME}|g" ${FILE}
