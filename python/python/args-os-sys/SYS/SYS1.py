import sys

def proccess_file(file):
    prev = ''
    count = 0
    for line in file:
        if line.strip('\n') == prev.strip('\n'):
            count += 1
        else:
            if count > 0:
                s = repr(prev.strip('\n'))
                print(f'{count} * {s}')
            count = 1
        prev = line
    s = repr(prev.strip('\n'))
    print(f'{count} * {s}')


def readAll():
    # chek args
    for i in sys.argv[1:]:
        print(i)
    if 1 < len(sys.argv):
        for filename in sys.argv[1:]:
            print('-----')
            with open(filename) as f:
                proccess_file(f)
    # dont have argscd
    else:
        input(sys.stdin)
        proccess_file(sys.stdin)



if __name__ == '__main__':
    readAll()

