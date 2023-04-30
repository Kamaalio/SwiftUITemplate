import os
import subprocess

from virtual_env import VirtualEnv


print("Pre-installing Python packages")
virtual_env = VirtualEnv("./.venv")
virtual_env.create(overwrite=True)
install_poetry_status = virtual_env.pip_install("Poetry")
if install_poetry_status != 0:
    raise Exception("Failed to install Poetry")

virtual_env.execute_binary("poetry", "install")

replace_zsh_conf = os.getenv("REPLACE_ZSH_CONF")
if replace_zsh_conf and replace_zsh_conf.lower() in ["true", "yes", "y"]:
    subprocess.Popen(["zsh", "scripts/setup_zsh_environment.zsh"]).wait()

print("Done setting up the environment")
