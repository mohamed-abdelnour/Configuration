"""Python startup file."""

import atexit
import os
import readline

histfile = os.path.join(
    os.path.expandvars("$XDG_STATE_HOME"), "python", "history"
)
try:
    readline.read_history_file(histfile)
    readline.set_history_length(1000)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile)
