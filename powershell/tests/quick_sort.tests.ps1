$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\sort\quick_sort.ps1"
. $sut

Describe "Sort-Quick" {
    It "sorts array of numbers" {
        $data = 10, 7, 8, 9, 1, 5
        $expected = 1, 5, 7, 8, 9, 10
        $result = Sort-Quick -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "sorts already sorted array" {
        $data = 1, 2, 3, 4, 5
        $expected = 1, 2, 3, 4, 5
        $result = Sort-Quick -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "sorts reverse sorted array" {
        $data = 5, 4, 3, 2, 1
        $expected = 1, 2, 3, 4, 5
        $result = Sort-Quick -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "sorts array with duplicates" {
        $data = 4, 2, 4, 2, 1
        $expected = 1, 2, 2, 4, 4
        $result = Sort-Quick -InputObject $data
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "handles empty array" {
        $data = @()
        $result = Sort-Quick -InputObject $data
        $result.Count | Should Be 0
    }
}
