#!/usr/bin/env bash
set -euo pipefail
ansible-playbook --inventory inventory --connection local --ask-become-pass playbook.yml "$@"
