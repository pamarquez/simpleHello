#!/bin/bash
#
if [[ -f /run/secrets/avain2 ]]; then
  read JEI < /data/nuukey
fi
export ENCRYPT_KEY=$JEI
/usr/bin/java -jar /data/pipeline-test-0.1.0.jar
