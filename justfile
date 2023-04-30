set export

setup-dev-env:
    #!/bin/sh

    SCRIPT_PATH="scripts/setup_dev_environment.py"
    python3 $SCRIPT_PATH

create-template:
    rm -rf Template
    . .venv/bin/activate
    cookiecutter .
    rm -rf Template/.git
