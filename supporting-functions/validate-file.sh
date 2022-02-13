#!/bin/bash

validate_file () {
  local options=':f:dt:'
  while getopts $options option; do
    case "$option" in
      f) FILE=${OPTARG};;
      d) USE_DEFAULT=${OPTARG};;
      t) TEMPLATE_FILE=${OPTARG};;
      *) echo "Error in the validate-file.sh script"; exit;;
    esac
  done

  if [[ -z "${FILE}" ]]; then
    if [[ "${USE_DEFAULT}" == "True" ]]; then
      FILE="${TEMPLATE_FILE}"
      echo "No file specified, using default template file: ${FILE}"
    else
      echo "No file specified, exiting..."
      echo ""
      echo "${usage}"
      exit 1
    fi
  fi

  if [[ ! -f "${FILE}" ]]; then
    if [[ "${USE_DEFAULT}" == "True" ]]; then
      echo "File not found: ${FILE}"
      FILE="${TEMPLATE_FILE}"
      echo "Using default template file: ${FILE}"
    else
      echo "File not found: ${FILE}"
      exit 1
    fi
  fi
}
