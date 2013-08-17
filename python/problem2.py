from sys import maxint

def memoise(f):
    memoised = {}
    def __wrapped__(*args):
        key = (f, args)
        if key not in memoised:
            memoised[key] = f(*args)
        return memoised[key]
            
    return __wrapped__

@memoise
def fib(n):
    return fib(n-1) + fib(n-2) if n > 1 else n

def valid_values(maximum, divisor):
    for n in xrange(1, maxint):
        val = fib(n)
        if val < maximum:
            if val % divisor == 0:
                yield val
        else:
            return  # no further vals will be < max, stop iterating

if __name__ == '__main__':
    print sum(valid_values(4000000, 2))
