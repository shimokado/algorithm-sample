function Search-Linear {
    <#
    .SYNOPSIS
        線形探索を用いて配列からターゲットを探します。
    .PARAMETER InputObject
        探索対象の配列
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

    for ($i = 0; $i -lt $InputObject.Count; $i++) {
        if ($InputObject[$i] -eq $Target) {
            return $i
        }
    }

    return -1
}
