import os
import sys
from argparse import ArgumentParser

parser = ArgumentParser(prog='allFiles', description="prints all files")
parser.add_argument('-d', '--directory', help='directory name to scan')
args = parser.parse_args()


# def p_get_all():
#     if args.directory:
#         os.chdir('..')
#         os.chdir('..')
#         curr = os.getcwd()
#         path = os.path.join(curr, args.directory)
#         return get_all(all=(path))
#     else:
#         return get_all()
#
#
# def get_all(all=os.getcwd()):
#     all = os.listdir(os.chdir(all))
#     dirs = []
#     for arg in all:
#         if os.path.isdir(arg):
#             dirs.append(arg)
#             dirs.extend(get_all(all=arg))
#             os.chdir('..')
#         else:
#             print(arg)
#     return (dirs)
#
#
# if __name__ == '__main__':
#     print(p_get_all())

# TEACHERS
def list_files_t(current_dir):
    filenames = os.listdir(current_dir)
    for filename in filenames:
        full_path = os.path.join(current_dir, filename)
        if os.path.isdir(full_path):
            list_files_t(full_path)
        else:
            print(filename)


list_files_t(args.directory)
