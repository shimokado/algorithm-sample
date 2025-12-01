import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from basic_math.sieve_of_eratosthenes import sieve_of_eratosthenes

def test_sieve_basic():
    n = 30
    expected = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    assert sieve_of_eratosthenes(n) == expected

def test_sieve_small():
    assert sieve_of_eratosthenes(10) == [2, 3, 5, 7]

def test_sieve_two():
    assert sieve_of_eratosthenes(2) == [2]

def test_sieve_less_than_two():
    assert sieve_of_eratosthenes(1) == []
    assert sieve_of_eratosthenes(0) == []
    assert sieve_of_eratosthenes(-10) == []
