function Invoke-Bfs {
    <#
    .SYNOPSIS
        幅優先探索 (BFS)
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
    $queue = [System.Collections.Queue]::new()

    $queue.Enqueue($Start)
    [void]$visited.Add($Start)

    while ($queue.Count -gt 0) {
        $node = $queue.Dequeue()
        [void]$result.Add($node)

        if ($Graph.Contains($node)) {
            foreach ($neighbor in $Graph[$node]) {
                if (-not $visited.Contains($neighbor)) {
                    [void]$visited.Add($neighbor)
                    $queue.Enqueue($neighbor)
                }
            }
        }
    }

    return ,$result.ToArray()
}
