#!/bin/bash
set -e

DIRNAME="$(dirname "$0")"
TEMPLATE_FILE="${DIRNAME}/templates/subtask-template.json"

source "${DIRNAME}/validate-file.sh"
source "${DIRNAME}/usage.sh"
source "${DIRNAME}/init.sh"

validate_file -f "${FILE}" -d "${USE_DEFAULT}" -t "${TEMPLATE_FILE}"

PARENT_ISSUE_ID=$(jq -r '.commonDetails.parentIssueId' ${FILE})
COMPONENTS=$(jq -r '.commonDetails.components' ${FILE})
REPORTER=$(jq -r '.commonDetails.reporter' ${FILE})

TICKET_ID=( )

for row in $(jq -r '.tickets[] | @base64' ${FILE}); do
  SUMMARY=$(echo ${row} | base64 --decode | jq -r '.summary')
  DESCRIPTION=$(echo ${row} | base64 --decode | jq -r '.description')
  TICKET_CREATION_STATUS=( $(jira subtask ${PARENT_ISSUE_ID} --noedit -o components="${COMPONENTS}" -o reporter="${REPORTER}" -o summary="${SUMMARY}" -o description="${DESCRIPTION}") )
  echo ${TICKET_CREATION_STATUS[@]}
  if [[ ${TICKET_CREATION_STATUS[0]} == "OK" ]]; then
    TICKET_ID+=( ${TICKET_CREATION_STATUS[1]} )
  else
    echo "Error while creating ticket. Values used:"
    echo "Parent Issue ID: ${PARENT_ISSUE_ID}"
    echo "Components: ${COMPONENTS}"
    echo "Reporter: ${REPORTER}"
    echo "Summary: ${SUMMARY}"
    echo "Description: ${DESCRIPTION}"
  fi
done

echo "Done!"
echo "Ticket IDs: ${TICKET_ID[@]}"
