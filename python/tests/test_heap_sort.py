import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from sort.heap_sort import heap_sort

def test_heap_sort_basic():
    data = [12, 11, 13, 5, 6, 7]
    expected = [5, 6, 7, 11, 12, 13]
    assert heap_sort(data) == expected

def test_heap_sort_sorted():
    data = [1, 2, 3, 4, 5]
    expected = [1, 2, 3, 4, 5]
    assert heap_sort(data) == expected

def test_heap_sort_reverse():
    data = [5, 4, 3, 2, 1]
    expected = [1, 2, 3, 4, 5]
    assert heap_sort(data) == expected

def test_heap_sort_duplicates():
    data = [4, 2, 4, 2, 1]
    expected = [1, 2, 2, 4, 4]
    assert heap_sort(data) == expected

def test_heap_sort_empty():
    data = []
    expected = []
    assert heap_sort(data) == expected
