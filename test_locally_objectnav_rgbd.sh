#!/usr/bin/env bash

DOCKER_NAME="objectnav_submission"

while [[ $# -gt 0 ]]
do
key="${1}"

case $key in
      --docker-name)
      shift
      DOCKER_NAME="${1}"
	  shift
      ;;
    *) # unknown arg
      echo unkown arg ${1}
      exit
      ;;
esac
done

docker run -v $(pwd)/habitat-challenge-data:/habitat-challenge-data \
    --runtime=nvidia \
    -e "AGENT_EVALUATION_TYPE=local" \
    -e "TRACK_CONFIG_FILE=/habitat-challenge-data/challenge_objectnav2020.local.rgbd.yaml" \
    ${DOCKER_NAME}\

