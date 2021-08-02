#! /bin/bash

export RESPONSE_CHK="False"
while [ "`echo ${RESPONSE_CHK}`" = "False" ]
do
  export RESPONSE=$(curl -X POST -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $1" "https://api.github.com/repos/maruyaki/pipeline-migration-try-02/pulls" -d "{\"head\": \"$2\", \"base\": \"$3\", \"title\": \"$4\"}")
  echo $RESPONSE >> log.txt

  export RESPONSE_FILTERED=`echo $RESPONCE | grep "Fail"`
  echo $RESPONSE_FILTERED >> log.txt
  
  if [ "$RESPONSE_FILTERED" = "" ]; then export RESPONSE_CHK="True"; fi
  echo 
done
