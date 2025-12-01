/**
 * 再帰を用いた深さ優先探索
 * 
 * @param graph 隣接リスト表現のグラフ {node: [neighbors]}
 * @param start 開始ノード
 * @returns 訪問順のノードリスト
 */
export function dfsRecursive(graph: Record<string, string[]>, start: string): string[] {
    const visited = new Set<string>();
    const result: string[] = [];

    function _dfs(node: string) {
        visited.add(node);
        result.push(node);

        if (graph[node]) {
            for (const neighbor of graph[node]) {
                if (!visited.has(neighbor)) {
                    _dfs(neighbor);
                }
            }
        }
    }

    _dfs(start);
    return result;
}

/**
 * スタックを用いた深さ優先探索（反復）
 * 
 * @param graph 隣接リスト表現のグラフ {node: [neighbors]}
 * @param start 開始ノード
 * @returns 訪問順のノードリスト
 */
export function dfsIterative(graph: Record<string, string[]>, start: string): string[] {
    const visited = new Set<string>();
    const result: string[] = [];
    const stack: string[] = [start];

    while (stack.length > 0) {
        const node = stack.pop()!;

        if (!visited.has(node)) {
            visited.add(node);
            result.push(node);

            if (graph[node]) {
                // スタックはLIFOなので、隣接リストを逆順に追加する
                for (let i = graph[node].length - 1; i >= 0; i--) {
                    const neighbor = graph[node][i];
                    if (!visited.has(neighbor)) {
                        stack.push(neighbor);
                    }
                }
            }
        }
    }

    return result;
}
