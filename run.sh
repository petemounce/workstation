#!/usr/bin/env bash
set -euo pipefail
ansible-playbook --inventory inventory.yml --ask-become-pass playbook.yml "$@"
