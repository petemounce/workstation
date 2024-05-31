# README

This is my mac; there are many like it, but this one is mine.

```bash
xcode-select --install || echo "xcode-select has been installed already, probably."
# then hit install on the GUI popup
```

```bash
curl --location --fail --show-error --silent https://github.com/petemounce/workstation/archive/refs/heads/master.zip --output "workstation-master.zip"
unzip -d "." "workstation-master.zip"
cd workstation-master
bash bin/bootstrap.sh
[[ -d ".venv" ]] && source ".venv/bin/activate"
bash bin/run.sh --list-tasks
```

If you're happy with that set of tasks and have read what they do:

```shell
bin/run.sh
```

You can pass flags and arguments to `bin/run.sh` and `ansible-playbook` will receive them.
