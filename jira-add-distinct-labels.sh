#!/bin/bash

FILE="templates/add-distinct-labels-template.json"

for row in $(jq -r '.tickets[] | @base64' ${FILE}); do
  TICKET_ID=$(echo ${row} | base64 --decode | jq -r '.ticket_id')
  LABEL=$(echo ${row} | base64 --decode | jq -r '.label')
  jira labels add ${TICKET_ID} ${LABEL}
done

echo "Done!"