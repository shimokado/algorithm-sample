import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from search.linear_search import linear_search

def test_linear_search_found():
    data = [10, 20, 30, 40, 50]
    assert linear_search(data, 30) == 2
    assert linear_search(data, 10) == 0
    assert linear_search(data, 50) == 4

def test_linear_search_not_found():
    data = [10, 20, 30, 40, 50]
    assert linear_search(data, 99) == -1

def test_linear_search_empty():
    data = []
    assert linear_search(data, 10) == -1

def test_linear_search_strings():
    data = ["apple", "banana", "cherry"]
    assert linear_search(data, "banana") == 1
    assert linear_search(data, "grape") == -1
