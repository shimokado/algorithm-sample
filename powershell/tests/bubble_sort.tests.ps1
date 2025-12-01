$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\sort\bubble_sort.ps1"
. $sut

Describe "Sort-Bubble" {
    It "sorts array of numbers" {
        $data = 64, 34, 25, 12, 22, 11, 90
        $expected = 11, 12, 22, 25, 34, 64, 90
        $result = Sort-Bubble -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "sorts already sorted array" {
        $data = 1, 2, 3, 4, 5
        $expected = 1, 2, 3, 4, 5
        $result = Sort-Bubble -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "sorts reverse sorted array" {
        $data = 5, 4, 3, 2, 1
        $expected = 1, 2, 3, 4, 5
        $result = Sort-Bubble -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "handles empty array" {
        $data = @()
        $result = Sort-Bubble -InputObject $data
        $result.Count | Should Be 0
    }
}
