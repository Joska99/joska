from itertools import takewhile
import sys


def primes():
    ps = []
    n = 2
    while True:
        for p in takewhile(lambda x: x * x <= n, ps):
            if n % p == 0:
                break
        else:
            yield n
            ps.append(n)
        n += 1


if __name__ == '__main__':
    n = int(sys.argv[1])

    for p in takewhile(lambda q: q < n, primes()):
        print(p)

##! run from console "python3 generator.py (any number) "