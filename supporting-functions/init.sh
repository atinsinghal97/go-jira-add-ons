#!/bin/bash

options=':hf:dvc:'
while getopts $options option; do
  case "${option}" in
    f) FILE="${OPTARG}";;
    d) USE_DEFAULT="True";;
    v) echo "Mode: Preview template file"; echo ""; cat "${TEMPLATE_FILE}"; exit;;
    c) echo "${OPTARG}"; echo "Mode: Copy template file. Creating a copy... at "${OPTARG}""; cp "${TEMPLATE_FILE}" "${OPTARG}"; exit;;
    *) echo "${usage}"; exit;;
  esac
done
