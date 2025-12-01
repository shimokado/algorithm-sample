const { bfs } = require('../src/graph/bfs');

// Graph structure:
//      A
//     / \
//    B   C
//   / \   \
//  D   E   F

const graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': [],
    'F': []
};

describe('Breadth-First Search (BFS)', () => {
    test('BFS visits nodes in correct order', () => {
        const expected = ['A', 'B', 'C', 'D', 'E', 'F'];
        expect(bfs(graph, 'A')).toEqual(expected);
    });

    test('handles disconnected graph', () => {
        const g = {
            'A': ['B'],
            'B': [],
            'G': []
        };
        expect(bfs(g, 'A')).toEqual(['A', 'B']);
    });
});
