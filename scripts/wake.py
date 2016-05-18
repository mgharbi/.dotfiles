#!/usr/bin/env python

import argparse
import subprocess

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("machine")
    args = parser.parse_args()

    # Ip and MAC adress from dhreg.csail.mit.edu
    if args.machine == "ephesia":
        ip = "128.30.96.109"
        mac = "14:dd:a9:d6:d6:a6"
    elif args.machine == "thousandeyes":
        ip = "128.30.96.134"
        mac = "14:dd:a9:d6:d6:8d"
    elif args.machine == "occam":
        ip = "128.30.96.55"
        mac = "00:22:4d:89:5a"
    elif args.machine == "luxo4":
        ip = "128.30.96.59"
        mac = "00:22:4d:98:bf:69"
    else:
        raise Exception("Machine unknown: {}".format(args.machine))

    cmd = ["wakeonlan","-i", ip,  mac]
    subprocess.call(cmd)
        
