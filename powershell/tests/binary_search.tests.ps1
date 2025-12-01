$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\search\binary_search.ps1"
. $sut

Describe "Search-Binary" {
    It "finds element in sorted array" {
        $data = 10, 20, 30, 40, 50
        Search-Binary -InputObject $data -Target 30 | Should Be 2
        Search-Binary -InputObject $data -Target 10 | Should Be 0
        Search-Binary -InputObject $data -Target 50 | Should Be 4
    }

    It "returns -1 when element not found" {
        $data = 10, 20, 30, 40, 50
        Search-Binary -InputObject $data -Target 25 | Should Be -1
        Search-Binary -InputObject $data -Target 5 | Should Be -1
        Search-Binary -InputObject $data -Target 55 | Should Be -1
    }

    It "works with empty array" {
        $data = @()
        Search-Binary -InputObject $data -Target 10 | Should Be -1
    }
}
