#!/usr/bin/env python3

import math
import subprocess
import sys
import time


def read_file(path):
    with open(path, "r") as input_file:
        output = input_file.readline().strip()
    return output


def check_args():
    args = sys.argv[1:]
    try:
        assert not args or args == ["-p"]
        return args
    except AssertionError:
        plural = "s" if len(args) > 1 else ""
        print(f"Unexpected argument{plural}: {args}")
        sys.exit()


def get_date_time():
    return time.strftime("%d/%m/%Y (%a) %H:%M")


def get_battery():
    percentage = read_file("/sys/class/power_supply/BAT1/capacity")
    indicator = (
        "+ " if read_file("/sys/class/power_supply/BAT1/status") == "Charging" else ""
    )
    return f"{indicator}{percentage}%"


def get_connection():
    return subprocess.run(
        ["nmcli", "networking", "connectivity"],
        capture_output=True,
        check=False,
        text=True,
    ).stdout.strip()


def status():
    return f"{date_time} | Battery: {battery} | Connection: {connection}"


arg = check_args()
i = 1
n = [20, 60]
lcm = math.lcm(*n)
battery = get_battery()
connection = get_connection()
while i <= lcm:
    date_time = get_date_time()
    if arg:
        print(status())
    else:
        subprocess.run(["xsetroot", "-name", f" {status()} "], check=False)
    if not i % n[0]:
        connection = get_connection()
    if not i % n[1]:
        battery = get_battery()
    if not i % lcm:
        i = 0
    i += 1
    time.sleep(1)
