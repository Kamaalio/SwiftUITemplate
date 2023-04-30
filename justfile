set export

setup-dev-env:
    #!/bin/sh

    SCRIPT_PATH="scripts/setup_dev_environment.py"
    python3 $SCRIPT_PATH

create-template:
    . .venv/bin/activate
    cookiecutter .
