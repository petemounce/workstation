#!/usr/bin/env bash
set -euo pipefail
ansible-playbook -i inventory -vvv playbook.yml --list-tasks
