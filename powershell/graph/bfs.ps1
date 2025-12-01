<#
.SYNOPSIS
    幅優先探索（BFS: Breadth-First Search）モジュール

.DESCRIPTION
    このモジュールは、グラフや木構造を探索するための幅優先探索アルゴリズムを
    実装しています。キューを使用してレベル順に探索を行います。

    時間計算量: O(V + E) - Vはノード数、Eはエッジ数
    空間計算量: O(V) - 訪問済みセット + キュー
#>

function Invoke-Bfs {
    <#
    .SYNOPSIS
        幅優先探索 (BFS)

    .DESCRIPTION
        幅優先探索は、グラフや木構造を探索するアルゴリズムの一つです。
        開始ノードから近い順（階層順）にノードを訪問していきます。

        アルゴリズムの手順:
        1. 開始ノードをキューに追加し、訪問済みとしてマーク
        2. キューから先頭のノードを取り出す
        3. そのノードの未訪問の隣接ノードを全てキューに追加し、訪問済みとしてマーク
        4. キューが空になるまで2-3を繰り返す

        特徴:
        - 最短経路問題に適している（重み無しグラフの場合）
        - レベル順に探索するため、近いノードから優先的に訪問
        - DFSと比較してメモリ使用量が多くなる場合がある

    .PARAMETER Graph
        隣接リスト表現のグラフ (Hashtable)
        例: @{ 'A' = @('B', 'C'); 'B' = @('D', 'E') }

    .PARAMETER Start
        開始ノード

    .OUTPUTS
        [object[]] 訪問順のノードリスト

    .EXAMPLE
        $graph = @{ 'A' = @('B', 'C'); 'B' = @('D'); 'C' = @('E') }
        Invoke-Bfs -Graph $graph -Start 'A'
        # 出力: @('A', 'B', 'C', 'D', 'E')
    #>
    param (
        [System.Collections.IDictionary]$Graph,
        [object]$Start
    )

    # 訪問済みノードを記録するHashSet
    # HashSet を使用することで、O(1) で訪問済みかどうかを確認できる
    $visited = [System.Collections.Generic.HashSet[object]]::new()

    # 訪問順序を記録するArrayList
    $result = [System.Collections.ArrayList]::new()

    # 探索するノードを管理するキュー
    # System.Collections.Queue を使用することで、FIFO（先入れ先出し）を実現
    $queue = [System.Collections.Queue]::new()

    # 開始ノードをキューに追加
    $queue.Enqueue($Start)
    # 開始ノードを訪問済みとしてマーク
    # BFSでは、キューに追加する時点で訪問済みとしてマークする
    # これにより、同じノードが複数回キューに追加されることを防ぐ
    [void]$visited.Add($Start)

    # キューが空になるまで探索を続ける
    while ($queue.Count -gt 0) {
        # キューの先頭からノードを取り出す（FIFO: 先入れ先出し）
        # Dequeue() で先頭要素を取り出す
        $node = $queue.Dequeue()

        # 取り出したノードを訪問順序に追加
        [void]$result.Add($node)

        # 現在のノードに隣接ノードが存在する場合
        if ($Graph.Contains($node)) {
            # 全ての隣接ノードを順番に処理
            foreach ($neighbor in $Graph[$node]) {
                # まだ訪問していないノードのみ処理
                if (-not $visited.Contains($neighbor)) {
                    # 訪問済みとしてマーク（キュー追加時にマークすることが重要）
                    [void]$visited.Add($neighbor)
                    # キューの末尾に追加
                    $queue.Enqueue($neighbor)
                }
            }
        }
    }

    # 訪問順序を配列として返す
    return ,$result.ToArray()
}
