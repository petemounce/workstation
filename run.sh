#!/usr/bin/env bash
set -euo pipefail
ansible-playbook playbook.yml "$@"
