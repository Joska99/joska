class LinkedList:
    #! (*) takes all args
    def __init__(self, *xs: tuple[int]):

        def make_ll(it):
            try:
                return next(it), make_ll(it)
            except StopIteration:
                return ()

        self.ll = make_ll(iter(xs))

    def __str__(self):
        return '<' + '-->'.join([str(x) for x in self]) + '>'

    def __iter__(self):
        return LLIterator(self.ll)


class LLIterator:

    def __init__(self, xs):
        self.ll = xs

    def __next__(self):
        if len(self.ll) != 0:
            y, self.ll = self.ll
            return y
        else:
            raise StopIteration()


#TODO: xs = (1, (2, (3, (4, (5, ())))))
xs = LinkedList(1, 2, 3, 4, 5)
print(xs)
xxs = [x * x for x in xs]
print(xxs)
print(xs)