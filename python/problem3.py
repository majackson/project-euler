import sys

def is_factor(n, f):
    """Returns True if f is a factor of n)"""
    return n % f == 0

def is_prime(n):
    return not any(f for f in factors(n) if f not in (1, n))

def primes(below=None):
    range_args = (2, sys.maxint) if not below else (below, 2, -1)
    return (p for p in xrange(*range_args) if is_prime(p))

def factors(n, reverse_order=False):
    range_args = (1, n+1) if reverse_order else (n, 0, -1)
    return (int(f) for f in (n/float(div) for div in xrange(*range_args))
                if f.is_integer())

def largest_prime_factor(n):
    return next(pf for pf in factors(n, reverse_order=True) 
                    if is_prime(pf))

if __name__ == '__main__':
    print largest_prime_factor(600851475143) 
