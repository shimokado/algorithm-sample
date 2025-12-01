import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from sort.quick_sort import quick_sort

def test_quick_sort_basic():
    data = [10, 7, 8, 9, 1, 5]
    expected = [1, 5, 7, 8, 9, 10]
    assert quick_sort(data) == expected

def test_quick_sort_sorted():
    data = [1, 2, 3, 4, 5]
    expected = [1, 2, 3, 4, 5]
    assert quick_sort(data) == expected

def test_quick_sort_reverse():
    data = [5, 4, 3, 2, 1]
    expected = [1, 2, 3, 4, 5]
    assert quick_sort(data) == expected

def test_quick_sort_duplicates():
    data = [4, 2, 4, 2, 1]
    expected = [1, 2, 2, 4, 4]
    assert quick_sort(data) == expected

def test_quick_sort_empty():
    data = []
    expected = []
    assert quick_sort(data) == expected
