#!/usr/bin/env bash
set -euo pipefail
ansible-playbook -i inventory -c local -K playbook.yml
