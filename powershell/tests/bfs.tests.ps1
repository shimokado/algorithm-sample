$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\graph\bfs.ps1"
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

Describe "Breadth-First Search (BFS)" {
    It "BFS visits nodes in correct order" {
        $expected = 'A', 'B', 'C', 'D', 'E', 'F'
        $result = Invoke-Bfs -Graph $graph -Start 'A'
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "handles disconnected graph" {
        $g = @{
            'A' = @('B')
            'B' = @()
            'G' = @()
        }
        $expected = 'A', 'B'
        $result = Invoke-Bfs -Graph $g -Start 'A'
        ($result -join ",") | Should Be ($expected -join ",")
    }
}
