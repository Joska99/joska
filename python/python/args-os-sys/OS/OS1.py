import os
import sys
from argparse import ArgumentParser

parser = ArgumentParser(prog='allFiles', description="prints all files")
parser.add_argument('-d', '--directory', help='directory name to scan')
args = parser.parse_args()


def list_files_t(current_dir):
    filenames = os.listdir(current_dir)
    for filename in filenames:
        full_path = os.path.join(current_dir, filename)
        if os.path.isdir(full_path):
            list_files_t(full_path)
        else:
            print(filename)


list_files_t(args.directory)
