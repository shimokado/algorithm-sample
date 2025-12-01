/**
 * 幅優先探索 (BFS)
 * 
 * @param graph 隣接リスト表現のグラフ {node: [neighbors]}
 * @param start 開始ノード
 * @returns 訪問順のノードリスト
 */
export function bfs(graph: Record<string, string[]>, start: string): string[] {
    const visited = new Set<string>();
    const result: string[] = [];
    const queue: string[] = [start];

    visited.add(start);

    while (queue.length > 0) {
        const node = queue.shift()!;
        result.push(node);

        if (graph[node]) {
            for (const neighbor of graph[node]) {
                if (!visited.has(neighbor)) {
                    visited.add(neighbor);
                    queue.push(neighbor);
                }
            }
        }
    }

    return result;
}
