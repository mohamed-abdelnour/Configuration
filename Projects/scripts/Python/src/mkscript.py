#!/usr/bin/env python3

import os
from argparse import ArgumentParser, Namespace
from pathlib import Path


def get_args() -> Namespace:
    parser = ArgumentParser()
    parser.add_argument("file", help="file name")
    parser.add_argument(
        "-s", "--shell", help="set the shell used in the shebang"
    )
    return parser.parse_args()


def shebang(binary: str) -> str:
    return f"#!/usr/bin/env {binary}"


def content_from_shell(shell: str) -> str:
    assert shell is not None, "SHELL must be specified if file has no extension"
    shells = {"bash", "dash", "sh", "zsh"}
    assert shell in shells, f"Unknown shell: '{shell}'"
    return shebang(shell)


def content_from_extension(extension: str) -> str:
    if extension == ".hs":
        content = "main :: IO ()\nmain = undefined"
    elif extension == ".py":
        content = shebang("python3")
    elif extension == ".rs":
        content = "fn main() {}"
    else:
        raise AssertionError(f"Unknown file extension: '{extension}'")
    return content


def write_file(file_path: str, content: str) -> None:
    with open(file_path, "x") as file:
        file.write(f"{content}\n")


def main() -> None:
    args = get_args()
    extension = Path(args.file).suffix
    scripts = {".py"}
    try:
        if not extension:
            content = content_from_shell(args.shell)
            is_script = True
        else:
            assert (
                args.shell is None
            ), "SHELL may not be set for files with extensions"
            content = content_from_extension(extension)
            is_script = extension in scripts
        write_file(args.file, content)
        if is_script:
            os.chmod(args.file, 0o755)
    except (AssertionError, FileExistsError, FileNotFoundError) as err:
        print(f"{err}.")


if __name__ == "__main__":
    main()
