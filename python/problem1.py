
def sum_multiples(below, multiples):
    return sum(n for n in xrange(1,below)
        if any(n % multiple == 0 for multiple in multiples))

if __name__ == '__main__':
    print sum_multiples(1000, [3,5])
