<#
.SYNOPSIS
    深さ優先探索（DFS: Depth-First Search）モジュール

.DESCRIPTION
    このモジュールは、グラフや木構造を探索するための深さ優先探索アルゴリズムを
    再帰版と反復版の両方で実装しています。

    時間計算量: O(V + E) - Vはノード数、Eはエッジ数
    空間計算量: O(V) - 訪問済みセット + スタック/再帰のスタック
#>

function Invoke-DfsRecursive {
    <#
    .SYNOPSIS
        再帰を用いた深さ優先探索

    .DESCRIPTION
        深さ優先探索は、グラフや木構造を探索するアルゴリズムの一つです。
        現在のノードから可能な限り深く進み、行き止まりに達したら
        戻って別の経路を探索します。

        この実装では、再帰呼び出しを使用してDFSを実現しています。
        再帰のコールスタックが暗黙的にスタックの役割を果たします。

        特徴:
        - 迷路の解探索やパズルの解法に適している
        - メモリ使用量が探索の深さに比例
        - 最短経路を見つけることは保証されない

    .PARAMETER Graph
        隣接リスト表現のグラフ (Hashtable)
        例: @{ 'A' = @('B', 'C'); 'B' = @('D', 'E') }

    .PARAMETER Start
        開始ノード

    .OUTPUTS
        [object[]] 訪問順のノードリスト

    .EXAMPLE
        $graph = @{ 'A' = @('B', 'C'); 'B' = @('D'); 'C' = @('E') }
        Invoke-DfsRecursive -Graph $graph -Start 'A'
        # 出力: @('A', 'B', 'D', 'C', 'E')
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

    # 内部再帰関数: 指定されたノードから深さ優先探索を行う
    function _Dfs($node) {
        # 現在のノードを訪問済みとしてマーク
        # [void] でAdd()の戻り値を破棄
        [void]$visited.Add($node)
        # 訪問順序に追加
        [void]$result.Add($node)

        # 現在のノードに隣接ノードが存在する場合
        # Contains()でキーの存在を確認
        if ($Graph.Contains($node)) {
            # 全ての隣接ノードを順番に処理
            foreach ($neighbor in $Graph[$node]) {
                # まだ訪問していないノードのみ再帰的に探索
                if (-not $visited.Contains($neighbor)) {
                    _Dfs $neighbor
                }
            }
        }
    }

    # 開始ノードからDFSを開始
    _Dfs $Start

    # 訪問順序を配列として返す
    return ,$result.ToArray()
}

function Invoke-DfsIterative {
    <#
    .SYNOPSIS
        スタックを用いた深さ優先探索（反復）

    .DESCRIPTION
        再帰を使わず、明示的なスタックを使用してDFSを実現します。
        再帰版と同じ結果を得るために、隣接ノードを逆順でスタックに追加します。

        再帰版との違い:
        - スタックオーバーフローのリスクがない
        - デバッグがしやすい
        - 状態を明示的に管理できる

    .PARAMETER Graph
        隣接リスト表現のグラフ (Hashtable)

    .PARAMETER Start
        開始ノード

    .OUTPUTS
        [object[]] 訪問順のノードリスト

    .EXAMPLE
        $graph = @{ 'A' = @('B', 'C'); 'B' = @('D'); 'C' = @('E') }
        Invoke-DfsIterative -Graph $graph -Start 'A'
        # 出力: @('A', 'B', 'D', 'C', 'E')
    #>
    param (
        [System.Collections.IDictionary]$Graph,
        [object]$Start
    )

    # 訪問済みノードを記録するHashSet
    $visited = [System.Collections.Generic.HashSet[object]]::new()

    # 訪問順序を記録するArrayList
    $result = [System.Collections.ArrayList]::new()

    # 探索するノードを管理するスタック
    # System.Collections.Stack を使用
    $stack = [System.Collections.Stack]::new()
    # 開始ノードをスタックに追加
    $stack.Push($Start)

    # スタックが空になるまで探索を続ける
    while ($stack.Count -gt 0) {
        # スタックからノードを取り出す（LIFO: 後入れ先出し）
        $node = $stack.Pop()

        # まだ訪問していないノードの場合のみ処理
        if (-not $visited.Contains($node)) {
            # 訪問済みとしてマーク
            [void]$visited.Add($node)
            # 訪問順序に追加
            [void]$result.Add($node)

            # 隣接ノードが存在する場合
            if ($Graph.Contains($node)) {
                $neighbors = $Graph[$node]
                # スタックはLIFO（後入れ先出し）なので、
                # 再帰版と同じ訪問順序にするために隣接リストを逆順に追加
                # 例: [A, B, C] を逆順に追加 → Aが最初にPopされる
                for ($i = $neighbors.Count - 1; $i -ge 0; $i--) {
                    $neighbor = $neighbors[$i]
                    # まだ訪問していないノードのみスタックに追加
                    if (-not $visited.Contains($neighbor)) {
                        $stack.Push($neighbor)
                    }
                }
            }
        }
    }

    # 訪問順序を配列として返す
    return ,$result.ToArray()
}
