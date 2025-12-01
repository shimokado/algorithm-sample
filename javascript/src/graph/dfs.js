/**
 * 再帰を用いた深さ優先探索（DFS: Depth-First Search）
 * 
 * 深さ優先探索は、グラフや木構造を探索するアルゴリズムの一つです。
 * 現在のノードから可能な限り深く進み、行き止まりに達したら
 * 戻って別の経路を探索します。
 * 
 * この実装では、再帰呼び出しを使用してDFSを実現しています。
 * 再帰のコールスタックが暗黙的にスタックの役割を果たします。
 * 
 * 特徴:
 * - 迷路の解探索やパズルの解法に適している
 * - メモリ使用量が探索の深さに比例
 * - 最短経路を見つけることは保証されない
 * 
 * 時間計算量: O(V + E) - Vはノード数、Eはエッジ数
 * 空間計算量: O(V) - 訪問済みセット + 再帰のスタック
 * 
 * @param {Object} graph 隣接リスト表現のグラフ {node: [neighbors]}
 * @param {string} start 開始ノード
 * @returns {Array} 訪問順のノードリスト
 */
function dfsRecursive(graph, start) {
    // 訪問済みノードを記録するセット
    // Set を使用することで、O(1) で訪問済みかどうかを確認できる
    const visited = new Set();

    // 訪問順序を記録する配列
    const result = [];

    /**
     * 内部再帰関数: 指定されたノードから深さ優先探索を行う
     * @param {string} node 現在のノード
     */
    function _dfs(node) {
        // 現在のノードを訪問済みとしてマーク
        visited.add(node);
        // 訪問順序に追加
        result.push(node);

        // 現在のノードに隣接ノードが存在する場合
        if (graph[node]) {
            // 全ての隣接ノードを順番に処理
            for (const neighbor of graph[node]) {
                // まだ訪問していないノードのみ再帰的に探索
                if (!visited.has(neighbor)) {
                    _dfs(neighbor);
                }
            }
        }
    }

    // 開始ノードからDFSを開始
    _dfs(start);
    return result;
}

/**
 * スタックを用いた深さ優先探索（反復版）
 * 
 * 再帰を使わず、明示的なスタックを使用してDFSを実現します。
 * 再帰版と同じ結果を得るために、隣接ノードを逆順でスタックに追加します。
 * 
 * 再帰版との違い:
 * - スタックオーバーフローのリスクがない
 * - デバッグがしやすい
 * - 状態を明示的に管理できる
 * 
 * 時間計算量: O(V + E) - Vはノード数、Eはエッジ数
 * 空間計算量: O(V) - 訪問済みセット + スタック
 * 
 * @param {Object} graph 隣接リスト表現のグラフ {node: [neighbors]}
 * @param {string} start 開始ノード
 * @returns {Array} 訪問順のノードリスト
 */
function dfsIterative(graph, start) {
    // 訪問済みノードを記録するセット
    const visited = new Set();

    // 訪問順序を記録する配列
    const result = [];

    // 探索するノードを管理するスタック
    // 開始ノードをスタックに追加
    const stack = [start];

    // スタックが空になるまで探索を続ける
    while (stack.length > 0) {
        // スタックの末尾からノードを取り出す（LIFO: 後入れ先出し）
        const node = stack.pop();

        // まだ訪問していないノードの場合のみ処理
        if (!visited.has(node)) {
            // 訪問済みとしてマーク
            visited.add(node);
            // 訪問順序に追加
            result.push(node);

            // 隣接ノードが存在する場合
            if (graph[node]) {
                // スタックはLIFO（後入れ先出し）なので、
                // 再帰版と同じ訪問順序にするために隣接リストを逆順に追加
                // 例: [A, B, C] を逆順に追加 → Aが最初にpopされる
                for (let i = graph[node].length - 1; i >= 0; i--) {
                    const neighbor = graph[node][i];
                    // まだ訪問していないノードのみスタックに追加
                    if (!visited.has(neighbor)) {
                        stack.push(neighbor);
                    }
                }
            }
        }
    }

    return result;
}

module.exports = { dfsRecursive, dfsIterative };
