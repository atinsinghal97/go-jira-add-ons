#!/bin/bash

FILE="templates/add-same-label-template.json"

LABEL=$(jq -r '.commonDetails.label' ${FILE})

for row in $(jq -r '.tickets[] | @base64' ${FILE}); do
  TICKET_ID=$(echo ${row} | base64 --decode)
  jira labels add ${TICKET_ID} ${LABEL}
done

echo "Done!"