$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\sort\insertion_sort.ps1"
. $sut

Describe "Sort-Insertion" {
    It "sorts array of numbers" {
        $data = 64, 25, 12, 22, 11
        $expected = 11, 12, 22, 25, 64
        $result = Sort-Insertion -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "sorts already sorted array" {
        $data = 1, 2, 3, 4, 5
        $expected = 1, 2, 3, 4, 5
        $result = Sort-Insertion -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "sorts reverse sorted array" {
        $data = 5, 4, 3, 2, 1
        $expected = 1, 2, 3, 4, 5
        $result = Sort-Insertion -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "handles empty array" {
        $data = @()
        $result = Sort-Insertion -InputObject $data
        $result.Count | Should Be 0
    }
}
