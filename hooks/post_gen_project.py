#!/usr/bin/env python
import os
import subprocess
from pathlib import Path
from typing import List, Optional, TypedDict

PROJECT_DIRECTORY = os.path.realpath(os.path.curdir)


class GitModule(TypedDict):
    name: str
    path: Optional[str]
    url: Optional[str]
    branch: Optional[str]


def make_command(args: List[str]):
    return " && ".join(args)


def execute_command(application: str, command: str):
    return subprocess.Popen([application, "-c", command])


def parse_git_modules():
    git_modules_file = Path(PROJECT_DIRECTORY) / ".gitmodules"

    git_modules: List[GitModule] = []
    git_module: Optional[GitModule] = None
    for item in git_modules_file.read_text().splitlines():
        item = item.strip()
        if item.startswith("[submodule"):
            if git_module:
                git_modules.append(git_module)
                git_module = None
            git_module = {
                "name": item.split('"')[-2],
                "branch": None,
                "path": None,
                "url": None,
            }
        else:
            key, value = item.split("=")
            assert git_module is not None
            git_module[key.strip()] = value.strip()

    if git_module:
        git_modules.append(git_module)

    return git_modules


execute_command("sh", make_command([f"cd {PROJECT_DIRECTORY}", "git init"])).wait()

git_modules = parse_git_modules()
git_modules_processes: List[subprocess.Popen[bytes]] = []
for git_module in git_modules:
    command = make_command(
        [f"cd {git_module['path']}", f"git clone {git_module['url']} ."]
    )
    process = execute_command("sh", command)
    git_modules_processes.append(process)

for process in git_modules_processes:
    status = process.wait()

execute_command(
    "sh", make_command(["git add .", 'git commit -m "Initial commit"'])
).wait()
