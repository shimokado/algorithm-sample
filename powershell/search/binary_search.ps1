function Search-Binary {
    <#
    .SYNOPSIS
        2分探索を用いてソート済みの配列からターゲットを探します。
    .PARAMETER InputObject
        ソート済みの探索対象配列
    .PARAMETER Target
        探索する値
    .OUTPUTS
        [int] 見つかった場合はそのインデックス、見つからない場合は -1
    #>
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [AllowEmptyCollection()]
        [object[]]$InputObject,

        [Parameter(Mandatory=$true)]
        [object]$Target
    )

    $left = 0
    $right = $InputObject.Count - 1

    while ($left -le $right) {
        $mid = [Math]::Floor(($left + $right) / 2)
        
        if ($InputObject[$mid] -eq $Target) {
            return $mid
        } elseif ($InputObject[$mid] -lt $Target) {
            $left = $mid + 1
        } else {
            $right = $mid - 1
        }
    }

    return -1
}
