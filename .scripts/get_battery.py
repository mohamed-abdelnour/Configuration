#!/usr/bin/env python3

import sys


def read_file(path):
    with open(path, "r") as input_file:
        output = input_file.readline()
    return output


def check_args():
    args = sys.argv[1:]
    try:
        assert not args or args in [["-f"], ["-g"]]
        return args
    except AssertionError:
        plural = "s" if len(args) > 1 else ""
        print(f"Unexpected argument{plural}: {args}")
        sys.exit()


def full_charge(message):
    full_design = int(read_file("/sys/class/power_supply/BAT1/charge_full_design"))
    full = int(read_file("/sys/class/power_supply/BAT1/charge_full"))
    print(f"{message} {full/full_design:.2%}")


def status(message):
    percentage = read_file("/sys/class/power_supply/BAT1/capacity").strip("\n")
    indicator = (
        "+ " if read_file("/sys/class/power_supply/BAT1/status") == "Charging\n" else ""
    )
    charge = int(read_file("/sys/class/power_supply/BAT1/charge_now"))
    current = int(read_file("/sys/class/power_supply/BAT1/current_now"))
    time = charge / current
    hours = int(time)
    minutes = int((time - hours) * 60)
    if indicator == "+ ":
        print(f"{message} {indicator}{percentage}%")
    else:
        print(f"{message} {indicator}{percentage}% ({hours:02}:{minutes:02})")


arg = check_args()
if not arg:
    full_charge("Full Charge:")
    status("Status:     ")
elif arg == ["-f"]:
    full_charge("Full Charge:")
else:
    status("Status:")
