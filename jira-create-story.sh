#!/bin/bash
set -e

DIRNAME="$(dirname "$0")"

source "${DIRNAME}/validate-file.sh"
source "${DIRNAME}/usage.sh"
source "${DIRNAME}/init.sh"

TEMPLATE_FILE="${DIRNAME}/templates/story-template.json"
validate_file -f "${FILE}" -d "${USE_DEFAULT}" -t "${TEMPLATE_FILE}"

PROJECT=$(jq -r '.commonDetails.project' ${FILE})
COMPONENTS=$(jq -r '.commonDetails.components' ${FILE})
REPORTER=$(jq -r '.commonDetails.reporter' ${FILE})
ISSUE_TYPE=$(jq -r '.commonDetails.issueType' ${FILE})

TICKET_ID=( )

for row in $(jq -r '.tickets[] | @base64' ${FILE}); do
  SUMMARY=$(echo ${row} | base64 --decode | jq -r '.summary')
  DESCRIPTION=$(echo ${row} | base64 --decode | jq -r '.description')
  TICKET_CREATION_STATUS=( $(jira create --noedit --issuetype=${ISSUE_TYPE} --project="${PROJECT}" -o components="${COMPONENTS}" -o reporter="${REPORTER}" -o summary="${SUMMARY}" -o description="${DESCRIPTION}") )
  echo ${TICKET_CREATION_STATUS[@]}
  if [[ ${TICKET_CREATION_STATUS[0]} == "OK" ]]; then
    TICKET_ID+=( ${TICKET_CREATION_STATUS[1]} )
  else
    echo "Error while creating ticket. Values used:"
    echo "Issue Type: ${ISSUE_TYPE}"
    echo "Project: ${PROJECT}"
    echo "Components: ${COMPONENTS}"
    echo "Reporter: ${REPORTER}"
    echo "Summary: ${SUMMARY}"
    echo "Description: ${DESCRIPTION}"
  fi
done

echo "Done!"
echo "Ticket IDs: ${TICKET_ID[@]}"
