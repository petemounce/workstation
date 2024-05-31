#!/usr/bin/env bash
set -o errexit -o errtrace -o nounset -o pipefail

/usr/bin/security find-generic-password -a "${USER}" -s "workstation" -w
