#!/bin/bash
set -e

DIRNAME="$(dirname "$0")"
TEMPLATE_FILE="${DIRNAME}/templates/add-multiple-labels-template.json"

source "${DIRNAME}/supporting-functions/validate-session.sh"
source "${DIRNAME}/supporting-functions/validate-file.sh"
source "${DIRNAME}/supporting-functions/usage.sh"
source "${DIRNAME}/supporting-functions/init.sh"

validate_file -f "${FILE}" -d "${USE_DEFAULT}" -t "${TEMPLATE_FILE}"

TICKET_ID=$(jq -r '.commonDetails.ticket' ${FILE})

for row in $(jq -r '.labels[] | @base64' ${FILE}); do
  LABEL=$(echo ${row} | base64 --decode)
  jira labels add ${TICKET_ID} ${LABEL}
done

echo "Done!"
