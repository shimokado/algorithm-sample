/**
 * 幅優先探索（BFS: Breadth-First Search）
 * 
 * 幅優先探索は、グラフや木構造を探索するアルゴリズムの一つです。
 * 開始ノードから近い順（階層順）にノードを訪問していきます。
 * 
 * アルゴリズムの手順:
 * 1. 開始ノードをキューに追加し、訪問済みとしてマーク
 * 2. キューから先頭のノードを取り出す
 * 3. そのノードの未訪問の隣接ノードを全てキューに追加し、訪問済みとしてマーク
 * 4. キューが空になるまで2-3を繰り返す
 * 
 * 特徴:
 * - 最短経路問題に適している（重み無しグラフの場合）
 * - レベル順に探索するため、近いノードから優先的に訪問
 * - DFSと比較してメモリ使用量が多くなる場合がある
 * 
 * 時間計算量: O(V + E) - Vはノード数、Eはエッジ数
 * 空間計算量: O(V) - 訪問済みセット + キュー
 * 
 * @param {Object} graph 隣接リスト表現のグラフ {node: [neighbors]}
 * @param {string} start 開始ノード
 * @returns {Array} 訪問順のノードリスト
 */
function bfs(graph, start) {
    // 訪問済みノードを記録するセット
    // Set を使用することで、O(1) で訪問済みかどうかを確認できる
    const visited = new Set();

    // 訪問順序を記録する配列
    const result = [];

    // 探索するノードを管理するキュー
    // 配列を使用（先頭から取り出し、末尾に追加）
    const queue = [start];

    // 開始ノードを訪問済みとしてマーク
    // BFSでは、キューに追加する時点で訪問済みとしてマークする
    // これにより、同じノードが複数回キューに追加されることを防ぐ
    visited.add(start);

    // キューが空になるまで探索を続ける
    while (queue.length > 0) {
        // キューの先頭からノードを取り出す（FIFO: 先入れ先出し）
        // shift() は配列の先頭要素を削除して返す
        const node = queue.shift();

        // 取り出したノードを訪問順序に追加
        result.push(node);

        // 現在のノードに隣接ノードが存在する場合
        if (graph[node]) {
            // 全ての隣接ノードを順番に処理
            for (const neighbor of graph[node]) {
                // まだ訪問していないノードのみ処理
                if (!visited.has(neighbor)) {
                    // 訪問済みとしてマーク（キュー追加時にマークすることが重要）
                    visited.add(neighbor);
                    // キューの末尾に追加
                    queue.push(neighbor);
                }
            }
        }
    }

    return result;
}

module.exports = { bfs };
