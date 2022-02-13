#!/bin/bash

usage="./$(basename "$0") [-h] [-f FILE_PATH] [-d] [-v] [-c COPY_TO_PATH]
Script to perform bulk actions on Jira.
where:
    -h  show this help text
    -f  to use a specific file
    -d  use default template file if no file is specified or file is not found
    -v  preview template file
    -c  create a copy of the template file to the specified location"
