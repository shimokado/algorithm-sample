import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from search.binary_search import binary_search

def test_binary_search_found():
    data = [10, 20, 30, 40, 50]
    assert binary_search(data, 30) == 2
    assert binary_search(data, 10) == 0
    assert binary_search(data, 50) == 4

def test_binary_search_not_found():
    data = [10, 20, 30, 40, 50]
    assert binary_search(data, 25) == -1
    assert binary_search(data, 5) == -1
    assert binary_search(data, 55) == -1

def test_binary_search_empty():
    data = []
    assert binary_search(data, 10) == -1
