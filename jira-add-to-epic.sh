#!/bin/bash

FILE="templates/add-to-epic-template.json"

EPIC_ID=$(jq -r '.commonDetails.epicId' ${FILE})

for row in $(jq -r '.tickets[] | @base64' ${FILE}); do
  TICKET_ID=$(echo ${row} | base64 --decode)
  jira epic add ${EPIC_ID} ${TICKET_ID}
done

echo "Done!"