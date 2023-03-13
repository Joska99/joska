import random

def monitored(func):
    calls = 0

    def invoke(*args, **kwargs):
        nonlocal calls
        calls += 1
        return func(*args, **kwargs), calls

    return invoke


@monitored
def sqr(x):
    return x * x


@monitored
def g():
    return 2


if __name__ == '__main__':
    for k in range(100):
        result, callsF = sqr(random.randrange(0, 100))
        for i in range(10):
            v, callsG = g()
