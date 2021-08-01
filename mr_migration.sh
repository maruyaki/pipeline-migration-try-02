#! /bin/bash

export RESPONSE_CHK="False"
while [ "`echo ${RESPONSE_CHK}`" = "False" ]
do
  export RESPONSE=$(curl -X POST -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${USER_TOKEN}" "https://api.github.com/repos/maruyaki/pipeline-migration-try-02/pulls" -d "{\"head\": \"${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}\", \"base\": \"${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}\", \"title\": \"${CI_MERGE_REQUEST_TITLE}\"}")
  echo ${RESPONSE} > log.txt
  export RESPONSE_FILTERED=`echo ${RESPONCE} | grep "Fail"`
  echo ${RESPONSE_FILTERED}
  
  if [ "${RESPONSE_FILTERED}" = "" ]; then export RESPONSE_CHK="True"; fi
done
