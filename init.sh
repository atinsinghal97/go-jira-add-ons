#!/bin/bash

options=':hf:d'
while getopts $options option; do
  case "${option}" in
    f) FILE="${OPTARG}";;
    d) USE_DEFAULT="True";;
    *) echo "${usage}"; exit;;
  esac
done
