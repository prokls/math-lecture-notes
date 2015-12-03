#!/usr/bin/env python3

import re
import argparse

def filtering(filepath, env='theorem'):
    """Filter file provided in `filepath` and with LaTeX environment `env`"""
    output = True
    with open(filepath) as fp:
        for line in fp.readlines():
            line = line[:-1]
            if '\\end{document}' in line:
                output = True
            if '\\begin{' + env + '}' in line:
                output = True
            
            if output:
                print(line)

            if '\\begin{document}' in line:
                output = False
            if '\\end{' + env + '}' in line:
                output = False

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('path', type=str, help='the path to the file to filter')
    parser.add_argument('-e', '--env', help='the LaTeX environment to filter')

    args = parser.parse_args()
    filtering(args.path, args.env)
