/**
 * 幅優先探索 (BFS)
 * 
 * @param {Object} graph 隣接リスト表現のグラフ {node: [neighbors]}
 * @param {string} start 開始ノード
 * @returns {Array} 訪問順のノードリスト
 */
function bfs(graph, start) {
    const visited = new Set();
    const result = [];
    const queue = [start]; // Array as queue

    visited.add(start);

    while (queue.length > 0) {
        const node = queue.shift(); // Dequeue
        result.push(node);

        if (graph[node]) {
            for (const neighbor of graph[node]) {
                if (!visited.has(neighbor)) {
                    visited.add(neighbor);
                    queue.push(neighbor); // Enqueue
                }
            }
        }
    }

    return result;
}

module.exports = { bfs };
