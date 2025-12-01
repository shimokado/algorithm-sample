function Invoke-DfsRecursive {
    <#
    .SYNOPSIS
        再帰を用いた深さ優先探索
    .PARAMETER Graph
        隣接リスト表現のグラフ (Hashtable)
    .PARAMETER Start
        開始ノード
    .OUTPUTS
        [object[]] 訪問順のノードリスト
    #>
    param (
        [System.Collections.IDictionary]$Graph,
        [object]$Start
    )

    $visited = [System.Collections.Generic.HashSet[object]]::new()
    $result = [System.Collections.ArrayList]::new()

    function _Dfs($node) {
        [void]$visited.Add($node)
        [void]$result.Add($node)

        if ($Graph.Contains($node)) {
            foreach ($neighbor in $Graph[$node]) {
                if (-not $visited.Contains($neighbor)) {
                    _Dfs $neighbor
                }
            }
        }
    }

    _Dfs $Start
    return ,$result.ToArray()
}

function Invoke-DfsIterative {
    <#
    .SYNOPSIS
        スタックを用いた深さ優先探索（反復）
    .PARAMETER Graph
        隣接リスト表現のグラフ (Hashtable)
    .PARAMETER Start
        開始ノード
    .OUTPUTS
        [object[]] 訪問順のノードリスト
    #>
    param (
        [System.Collections.IDictionary]$Graph,
        [object]$Start
    )

    $visited = [System.Collections.Generic.HashSet[object]]::new()
    $result = [System.Collections.ArrayList]::new()
    $stack = [System.Collections.Stack]::new()
    $stack.Push($Start)

    while ($stack.Count -gt 0) {
        $node = $stack.Pop()

        if (-not $visited.Contains($node)) {
            [void]$visited.Add($node)
            [void]$result.Add($node)

            if ($Graph.Contains($node)) {
                $neighbors = $Graph[$node]
                # スタックはLIFOなので、隣接リストを逆順に追加する
                for ($i = $neighbors.Count - 1; $i -ge 0; $i--) {
                    $neighbor = $neighbors[$i]
                    if (-not $visited.Contains($neighbor)) {
                        $stack.Push($neighbor)
                    }
                }
            }
        }
    }

    return ,$result.ToArray()
}
