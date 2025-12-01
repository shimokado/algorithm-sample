import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from sort.bubble_sort import bubble_sort

def test_bubble_sort_basic():
    data = [64, 34, 25, 12, 22, 11, 90]
    expected = [11, 12, 22, 25, 34, 64, 90]
    assert bubble_sort(data) == expected

def test_bubble_sort_sorted():
    data = [1, 2, 3, 4, 5]
    expected = [1, 2, 3, 4, 5]
    assert bubble_sort(data) == expected

def test_bubble_sort_reverse():
    data = [5, 4, 3, 2, 1]
    expected = [1, 2, 3, 4, 5]
    assert bubble_sort(data) == expected

def test_bubble_sort_empty():
    data = []
    expected = []
    assert bubble_sort(data) == expected
