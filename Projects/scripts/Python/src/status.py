#!/usr/bin/env python3

import math
import subprocess
import time
from argparse import ArgumentParser, Namespace


def get_args() -> Namespace:
    parser = ArgumentParser()
    parser.add_argument(
        "-p", "--stdout", action="store_true", help="print status to stdout"
    )
    return parser.parse_args()


def read_file(path: str) -> str:
    with open(path, "r") as input_file:
        output = input_file.readline().strip()
    return output


def get_date_time() -> str:
    return time.strftime("%d/%m/%Y (%a) %H:%M")


def get_battery() -> str:
    percentage = read_file("/sys/class/power_supply/BAT1/capacity")
    indicator = (
        "+ "
        if read_file("/sys/class/power_supply/BAT1/status") == "Charging"
        else ""
    )
    return f"{indicator}{percentage}%"


def get_connection() -> str:
    return subprocess.run(
        ["nmcli", "networking", "connectivity"],
        capture_output=True,
        check=False,
        text=True,
    ).stdout.strip()


def main() -> None:
    args = get_args()
    seconds = 1
    increments = [20, 60]
    lcm = math.lcm(*increments)
    battery = get_battery()
    connection = get_connection()
    while seconds <= lcm:
        date_time = get_date_time()
        status = f"{date_time} | Battery: {battery} | Connection: {connection}"
        if args.stdout:
            print(status)
        else:
            subprocess.run(["xsetroot", "-name", f" {status} "], check=False)
        if not seconds % increments[0]:
            connection = get_connection()
        if not seconds % increments[1]:
            battery = get_battery()
        if not seconds % lcm:
            seconds = 0
        seconds += 1
        time.sleep(1)


if __name__ == "__main__":
    main()
