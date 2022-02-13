#!/bin/bash

validate_session () {
    JIRA_SESSION="$(jira session | tee /dev/null)"
    STATUS="$(echo ${JIRA_SESSION} | cut -d' ' -f1)"
    if [ "${STATUS}" != "loginInfo:" ]; then
        echo "ERROR:"
        echo "${JIRA_SESSION}"
        echo "Please login to JIRA first."
        exit 1
    fi
}

validate_session
