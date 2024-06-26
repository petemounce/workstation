#!/usr/bin/env bash
set -o errexit -o errtrace -o nounset -o pipefail
set -x

#sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.15.pkg -target /
export PATH="${HOME}/.cargo/bin:${PATH}"
if ! command -v uv > "/dev/null"; then
	UV_VERSION="0.1.44"
	curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/${UV_VERSION}/uv-installer.sh | sh
fi
if python3 --version > "/dev/null"; then
	uv venv
	source ".venv/bin/activate"
	uv pip install --requirement "requirements.txt"
else
	uv pip install --system --requirement "requirements.txt"
fi
ansible-playbook --version
ansible-galaxy collection install --requirements-file "requirements.yml"
if ! [[ -d "roles-external" ]]; then
	ansible-galaxy role install --role-file "requirements.yml" --roles-path "roles-external"
fi
