$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\math\gcd.ps1"
. $sut

Describe "Get-Gcd" {
    It "calculates gcd of positive integers" {
        Get-Gcd -A 48 -B 18 | Should Be 6
        Get-Gcd -A 1071 -B 1029 | Should Be 21
    }

    It "calculates gcd with zero" {
        Get-Gcd -A 5 -B 0 | Should Be 5
        Get-Gcd -A 0 -B 5 | Should Be 5
        Get-Gcd -A 0 -B 0 | Should Be 0
    }

    It "calculates gcd of negative integers" {
        Get-Gcd -A -48 -B 18 | Should Be 6
        Get-Gcd -A 48 -B -18 | Should Be 6
        Get-Gcd -A -48 -B -18 | Should Be 6
    }

    It "calculates gcd of prime numbers" {
        Get-Gcd -A 17 -B 13 | Should Be 1
    }
}
