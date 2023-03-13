from multiprocessing import Process, Queue
from multiprocessing.pool import Pool
from time import sleep


def sum_of_squares(n: int, q=0, new=0, i=0):
    if n == 0:
        return 0
        # q.put(f'{new} - > {i}\n')
        #
        # with open('text.txt', 'a') as f:
        #     f.write(f'{new} - > {i}\n')
    else:
        sleep(0.5)
        new += n ** 2
        return sum_of_squares(n - 1, q, new, i=i + 1)


if __name__ == "__main__":
    s = input("enter list of nums seperated by ,: ")
    ns = [int(s) for s in s.split(',')]

    pool = Pool(processes = 3)
    nns = pool.map(sum_of_squares,ns)
    print(ns)



    # q = Queue()
    # for n in ns:
    #     p = Process(target=sum_of_squares, args=(n, q))
    #     p.start()
    # for k in range(len(ns)):
    #     print(q.get())
    # for k in range(len(ns)):
    #     p.join()
    # q.close()

    # while not (q.empty()):
    #     a = q.get()
    #     print(a)
    # q.close()

    # while True:
    #     n = int(input('Enter a positive intiger:'))
    #     if n == 0:
    #         break
    #     else:
    #         # 1 ** 1 2 ** 2
    #         p = Process(target=sum_of_squares, args=(n,))
    #         p.start()
    #         print(p)
