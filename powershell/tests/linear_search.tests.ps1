$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\search\linear_search.ps1"
. $sut

Describe "Search-Linear" {
    It "finds element in array" {
        $data = 10, 20, 30, 40, 50
        Search-Linear -InputObject $data -Target 30 | Should Be 2
        Search-Linear -InputObject $data -Target 10 | Should Be 0
        Search-Linear -InputObject $data -Target 50 | Should Be 4
    }

    It "returns -1 when element not found" {
        $data = 10, 20, 30, 40, 50
        Search-Linear -InputObject $data -Target 99 | Should Be -1
    }

    It "works with empty array" {
        $data = @()
        Search-Linear -InputObject $data -Target 10 | Should Be -1
    }

    It "works with strings" {
        $data = "apple", "banana", "cherry"
        Search-Linear -InputObject $data -Target "banana" | Should Be 1
        Search-Linear -InputObject $data -Target "grape" | Should Be -1
    }
}
