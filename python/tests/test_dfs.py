import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from graph.dfs import dfs_recursive, dfs_iterative

# Graph structure:
#      A
#     / \
#    B   C
#   / \   \
#  D   E   F

graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': [],
    'F': []
}

def test_dfs_recursive():
    # Expected order: A -> B -> D -> E -> C -> F
    expected = ['A', 'B', 'D', 'E', 'C', 'F']
    assert dfs_recursive(graph, 'A') == expected

def test_dfs_iterative():
    # Expected order: A -> B -> D -> E -> C -> F
    expected = ['A', 'B', 'D', 'E', 'C', 'F']
    assert dfs_iterative(graph, 'A') == expected

def test_dfs_disconnected():
    # Graph with disconnected node G
    #      A
    #     / 
    #    B   G
    g = {
        'A': ['B'],
        'B': [],
        'G': []
    }
    assert dfs_recursive(g, 'A') == ['A', 'B']
    assert dfs_iterative(g, 'A') == ['A', 'B']
