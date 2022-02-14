# Changelog

## GO-JIRA Add-Ons

### v1.1

- overrides `commonDetails.reporter` to set an empty string.

### v1.0

_Note: v1.0 has no code changes compared to v0.5. It marks a stable release and adds sample files._

- add sample alias and config files
- add licence and add codeowner info for opensource contributions & PRs
- includes info for

### v0.5

- fix validate-session.sh
- if jira session cannot be validated, an error will be shown instead of a silent exit :)
- restructure repo

### v0.4

- add `jira session` validation

### v0.3

- add options to view template file and create a local copy of the template

### v0.2

- add parameter flag support and update the scripts such that they can be invoked from anywhere by setting aliases

### v0.1

- init
- Add scripts for common use-cases:
  - Create story
  - Create subtask
  - Add story to epic
  - Add a label to multiple issues
  - Add multiple labels to a single issue
  - Add distinct (single) labels to multiple issues
