# Decorator - @staticmethod and @classmethod

class Date:
    def __init__(self, year, month, day):
        self.year = year
        self.month = month
        self.day = day

    @classmethod
    def from_string(cls, s: str):
        # parse s
        year, month, day = s.split('-')
        return Date(int(year), int(month), int(day))

    @staticmethod
    def from_unix_time(sec: int):
        return Date.from_string('1970 - 1 - 1')


if __name__ == '__main__':
    d = Date.from_string('2023-02-13')
    d2 = Date.from_unix_time(0)
    print(d, d2)
