$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\sort\heap_sort.ps1"
. $sut

Describe "Sort-Heap" {
    It "sorts array of numbers" {
        $data = 12, 11, 13, 5, 6, 7
        $expected = 5, 6, 7, 11, 12, 13
        $result = Sort-Heap -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "sorts already sorted array" {
        $data = 1, 2, 3, 4, 5
        $expected = 1, 2, 3, 4, 5
        $result = Sort-Heap -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "sorts reverse sorted array" {
        $data = 5, 4, 3, 2, 1
        $expected = 1, 2, 3, 4, 5
        $result = Sort-Heap -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "sorts array with duplicates" {
        $data = 4, 2, 4, 2, 1
        $expected = 1, 2, 2, 4, 4
        $result = Sort-Heap -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "handles empty array" {
        $data = @()
        $result = Sort-Heap -InputObject $data
        $result.Count | Should Be 0
    }
}
