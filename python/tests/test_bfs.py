import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from graph.bfs import bfs

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

def test_bfs():
    # Expected order: A -> B -> C -> D -> E -> F
    # Note: The order of siblings (B, C) depends on the adjacency list order.
    # Here A->[B, C], so B is visited before C.
    # Then neighbors of B (D, E) are added, then neighbors of C (F) are added.
    expected = ['A', 'B', 'C', 'D', 'E', 'F']
    assert bfs(graph, 'A') == expected

def test_bfs_disconnected():
    # Graph with disconnected node G
    #      A
    #     / 
    #    B   G
    g = {
        'A': ['B'],
        'B': [],
        'G': []
    }
    assert bfs(g, 'A') == ['A', 'B']
