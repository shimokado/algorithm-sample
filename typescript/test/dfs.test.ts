import { dfsRecursive, dfsIterative } from '../src/graph/dfs';

// Graph structure:
//      A
//     / \
//    B   C
//   / \   \
//  D   E   F

const graph: Record<string, string[]> = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': [],
    'F': []
};

describe('Depth-First Search (DFS)', () => {
    test('recursive DFS visits nodes in correct order', () => {
        const expected = ['A', 'B', 'D', 'E', 'C', 'F'];
        expect(dfsRecursive(graph, 'A')).toEqual(expected);
    });

    test('iterative DFS visits nodes in correct order', () => {
        const expected = ['A', 'B', 'D', 'E', 'C', 'F'];
        expect(dfsIterative(graph, 'A')).toEqual(expected);
    });

    test('handles disconnected graph', () => {
        const g: Record<string, string[]> = {
            'A': ['B'],
            'B': [],
            'G': []
        };
        expect(dfsRecursive(g, 'A')).toEqual(['A', 'B']);
        expect(dfsIterative(g, 'A')).toEqual(['A', 'B']);
    });
});
