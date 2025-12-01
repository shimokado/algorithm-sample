function Get-Gcd {
    <#
    .SYNOPSIS
        ユークリッドの互除法を用いて最大公約数を計算します。
    .PARAMETER A
        整数
    .PARAMETER B
        整数
    .OUTPUTS
        [int] 最大公約数
    #>
    param (
        [int]$A,
        [int]$B
    )

    $A = [Math]::Abs($A)
    $B = [Math]::Abs($B)

    while ($B -ne 0) {
        $temp = $B
        $B = $A % $B
        $A = $temp
    }

    return $A
}
