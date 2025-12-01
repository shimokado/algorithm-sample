function Get-PrimesSieve {
    <#
    .SYNOPSIS
        エラトステネスのふるいを用いて、n以下の素数のリストを返します。
    .PARAMETER N
        上限値
    .OUTPUTS
        [int[]] n以下の素数のリスト
    #>
    param (
        [Parameter(Mandatory=$true)]
        [int]$N
    )

    if ($N -lt 2) {
        return @()
    }

    $isPrime = [bool[]]::new($N + 1)
    for ($i = 0; $i -le $N; $i++) { $isPrime[$i] = $true }
    $isPrime[0] = $false
    $isPrime[1] = $false

    $p = 2
    while ($p * $p -le $N) {
        if ($isPrime[$p]) {
            for ($i = $p * $p; $i -le $N; $i += $p) {
                $isPrime[$i] = $false
            }
        }
        $p++
    }

    $primes = @()
    for ($i = 2; $i -le $N; $i++) {
        if ($isPrime[$i]) {
            $primes += $i
        }
    }

    return ,$primes
}
