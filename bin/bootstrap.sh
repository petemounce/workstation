#!/usr/bin/env bash
set -eu -o pipefail
set -x

UV_VERSION="0.1.44"
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/${UV_VERSION}/uv-installer.sh | sh
#xcode-select --install || echo "xcode-select has been installed already, probably."
#sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.15.pkg -target /
export PATH="${HOME}/.cargo/bin:${PATH}"
uv venv
source ".venv/bin/activate"
ANSIBLE_VERSION="${1:-2.9.11}"
uv pip install "ansible==${ANSIBLE_VERSION}"
ansible-galaxy install --role-file "requirements.yml" --roles-path "roles-external"
