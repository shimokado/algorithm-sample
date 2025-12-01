import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from sort.insertion_sort import insertion_sort

def test_insertion_sort_basic():
    data = [64, 25, 12, 22, 11]
    expected = [11, 12, 22, 25, 64]
    assert insertion_sort(data) == expected

def test_insertion_sort_sorted():
    data = [1, 2, 3, 4, 5]
    expected = [1, 2, 3, 4, 5]
    assert insertion_sort(data) == expected

def test_insertion_sort_reverse():
    data = [5, 4, 3, 2, 1]
    expected = [1, 2, 3, 4, 5]
    assert insertion_sort(data) == expected

def test_insertion_sort_empty():
    data = []
    expected = []
    assert insertion_sort(data) == expected
