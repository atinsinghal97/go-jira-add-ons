# GO-JIRA Add-Ons <!-- omit in toc -->

- [Prereqs](#prereqs)
- [Configuration](#configuration)
- [Can I Perform Actions in Bulk?](#can-i-perform-actions-in-bulk)

## Prereqs

1. Make sure you've [`brew`](https://brew.sh/) installed.

1. Install [`go-jira`](https://github.com/go-jira/jira) using brew:

   ```bash
   brew install go-jira
   ```

## Configuration

1. Prepare your local configuration file:

   ```bash
   mkdir ~/.jira.d

   cat <<EOM >~/.jira.d/config.yml
   endpoint: https://jira.mycompany.com
   EOM
   ```

1. Now use `jira login` to authenticate yourself as $USER. To change your username, use the -u CLI flag or set user: in your config.yml

To learn about custom-commands and scripts, [read here](https://github.com/go-jira/jira).

## Can I Perform Actions in Bulk?

A few scripts for common use-cases are available which can help you perform actions in bulk. Feel free to create PRs to add other use-cases.

|                                       **Script**                                       |                                              **Template**                                               |
| :------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------: |
|                      [Create Story Script](/jira-create-story.sh)                      |                         [Create Story Template](templates/story-template.json)                          |
|                    [Create Subtask Script](/jira-create-subtask.sh)                    |                       [Create Subtask Template](templates/subtask-template.json)                        |
|                    [Add Issue to Epic Script](/jira-add-to-epic.sh)                    |                    [Add Issue to Epic Template](templates/add-to-epic-template.json)                    |
|          [Add Same Label to Multiple Issues Script](/jira-add-same-label.sh)           |              [Add Same Label to Multiple Template](templates/add-same-label-template.json)              |
|       [Add Multiple Labels to Single Issue Script](/jira-add-multiple-labels.sh)       |       [Add Multiple Labels to Single Issue Template](templates/add-multiple-labels-template.json)       |
| [Add Distinct (Single) Labels to Multiple Issues Script](/jira-add-distinct-labels.sh) | [Add Distinct (Single) Labels to Multiple Issues Template](templates/add-distinct-labels-template.json) |
