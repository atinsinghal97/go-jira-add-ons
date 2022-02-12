#!/bin/bash

FILE="templates/add-multiple-labels-template.json"

TICKET_ID=$(jq -r '.commonDetails.ticket' ${FILE})

for row in $(jq -r '.labels[] | @base64' ${FILE}); do
  LABEL=$(echo ${row} | base64 --decode)
  jira labels add ${TICKET_ID} ${LABEL}
done

echo "Done!"