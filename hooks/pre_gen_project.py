import sys


VALUES = {
    "app_identifier": "{{ cookiecutter.app_identifier }}",
    "app_name": "{{ cookiecutter.app_name }}",
    "creation_date": "{{ cookiecutter.creation_date }}",
    "full_name": "{{ cookiecutter.full_name }}",
}


def panic(message: str):
    print(message)
    sys.exit(1)


for key, value in VALUES.items():
    if len(value) == 0:
        panic(f"Invalid value for {key}")

    if key == "app_identifier":
        splitted_identifier = value.split(".")
        if len(splitted_identifier) < 3:
            panic("Invalid app identifier")

        for component in splitted_identifier:
            stripped_component = component.strip()
            if len(stripped_component) == 0:
                panic("Invalid app identifier")

            if len(stripped_component) != len(component):
                panic("Invalid app identifier")
