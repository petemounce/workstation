# macOS borks on this var being set
unset PYTHONPATH

export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
