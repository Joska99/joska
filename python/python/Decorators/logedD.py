import random
from datetime import datetime
from monitoredD import monitored


def loged(func):
    def chek(*args, **kwargs):
        with open('log.txt', 'a') as log:
            log.write(f'{datetime.now():%H:%M:%S} {func.__name__}()\n')
        return func(*args, **kwargs)

    return chek


@monitored
@loged
def sqr(x):
    return (x * x)


@monitored
@loged
def g():
    return ('jopa')


if __name__ == "__main__":
    for k in range(10):
        result, sqr_calls = sqr(random.randrange(0, 10))
        print(result)
        for i in range(2):
            _, g_calls = g()

    with open('log.txt', "a") as f:
        f.write(f'{sqr_calls} ,{g_calls}\n')

    print(f'sqr() was called {sqr_calls} times.')
    print(f'g() was called {g_calls} times.')

