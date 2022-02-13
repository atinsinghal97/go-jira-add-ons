#!/bin/bash
set -e

DIRNAME="$(dirname "$0")"
TEMPLATE_FILE="${DIRNAME}/templates/add-same-label-template.json"

source "${DIRNAME}/validate-session.sh"
source "${DIRNAME}/validate-file.sh"
source "${DIRNAME}/usage.sh"
source "${DIRNAME}/init.sh"

validate_file -f "${FILE}" -d "${USE_DEFAULT}" -t "${TEMPLATE_FILE}"

LABEL=$(jq -r '.commonDetails.label' ${FILE})

for row in $(jq -r '.tickets[] | @base64' ${FILE}); do
  TICKET_ID=$(echo ${row} | base64 --decode)
  jira labels add ${TICKET_ID} ${LABEL}
done

echo "Done!"
