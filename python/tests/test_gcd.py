import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from basic_math.gcd import gcd

def test_gcd_basic():
    assert gcd(48, 18) == 6
    assert gcd(1071, 1029) == 21

def test_gcd_with_zero():
    assert gcd(5, 0) == 5
    assert gcd(0, 5) == 5
    assert gcd(0, 0) == 0

def test_gcd_negative():
    assert gcd(-48, 18) == 6
    assert gcd(48, -18) == 6
    assert gcd(-48, -18) == 6

def test_gcd_prime():
    assert gcd(17, 13) == 1
