$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\graph\dfs.ps1"
. $sut

# Graph structure:
#      A
#     / \
#    B   C
#   / \   \
#  D   E   F
$graph = @{
    'A' = @('B', 'C')
    'B' = @('D', 'E')
    'C' = @('F')
    'D' = @()
    'E' = @()
    'F' = @()
}

Describe "Depth-First Search (DFS)" {
    It "recursive DFS visits nodes in correct order" {
        $expected = 'A', 'B', 'D', 'E', 'C', 'F'
        $result = Invoke-DfsRecursive -Graph $graph -Start 'A'
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "iterative DFS visits nodes in correct order" {
        $expected = 'A', 'B', 'D', 'E', 'C', 'F'
        $result = Invoke-DfsIterative -Graph $graph -Start 'A'
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "handles disconnected graph" {
        $g = @{
            'A' = @('B')
            'B' = @()
            'G' = @()
        }
        $expected = 'A', 'B'
        
        $resultRecursive = Invoke-DfsRecursive -Graph $g -Start 'A'
        ($resultRecursive -join ",") | Should Be ($expected -join ",")

        $resultIterative = Invoke-DfsIterative -Graph $g -Start 'A'
        ($resultIterative -join ",") | Should Be ($expected -join ",")
    }
}
