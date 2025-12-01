$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\math\sieve_of_eratosthenes.ps1"
. $sut

Describe "Get-PrimesSieve" {
    It "finds primes up to 30" {
        $n = 30
        $expected = 2, 3, 5, 7, 11, 13, 17, 19, 23, 29
        $result = Get-PrimesSieve -N $n
        ($result -join ",") | Should Be ($expected -join ",")
    }

    It "finds primes up to 10" {
        $result = Get-PrimesSieve -N 10
        ($result -join ",") | Should Be "2,3,5,7"
    }

    It "finds primes up to 2" {
        $result = Get-PrimesSieve -N 2
        ($result -join ",") | Should Be "2"
    }

    It "returns empty array for n < 2" {
        $result = Get-PrimesSieve -N 1
        $result.Count | Should Be 0
        
        $result = Get-PrimesSieve -N 0
        $result.Count | Should Be 0
        
        $result = Get-PrimesSieve -N -10
        $result.Count | Should Be 0
    }
}
