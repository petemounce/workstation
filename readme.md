# README

This is my mac; there are many like it, but this one is mine.

1. Install XCode developer tools:

    ```bash
    xcode-select --install || echo "xcode-select has been installed already, probably."
    # then hit install on the GUI popup
    ```

1. Get bootstrapped:

    ```bash
    curl --location --fail --show-error --silent https://github.com/petemounce/workstation/archive/refs/heads/master.zip --output "workstation-master.zip"
    unzip -d "." "workstation-master.zip"
    cd workstation-master
    bash bin/bootstrap.sh
    [[ -d ".venv" ]] && source ".venv/bin/activate"
    bash bin/run.sh --list-tasks
    ```

1. To avoid needing to use `--ask-become-pass` and typing your user's password on every run-through:

    1. Make an ansible vault password inside macOS keychain to avoid needing to type your account password every run-through:

        ```bash
        security add-generic-password -a "${USER}" -j "ansible-vault password for workstation repo" -s "workstation" -w
        ```

        ... and supply a password then confirm it.

    1. Make an ansible-vault encrypted file with your user account's password in it, like:

        ```bash
        ansible-vault create "secrets.yml"
        ```

        ... with content:

        ```yaml
        ansible_become_password: 'your password'
        ```

1. If you're happy with that set of tasks and have read what they do:

    ```shell
    bin/run.sh
    ```

    You can pass flags and arguments to `bin/run.sh` and `ansible-playbook` will receive them.
