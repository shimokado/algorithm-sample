function Sort-Merge {
    <#
    .SYNOPSIS
        マージソートを用いて配列を昇順にソートします。
    .PARAMETER InputObject
        ソート対象の配列
    .OUTPUTS
        [object[]] ソートされた配列
    #>
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [AllowEmptyCollection()]
        [object[]]$InputObject
    )

    $array = $InputObject
    if ($array.Count -le 1) {
        return ,$array
    }

    $mid = [math]::Floor($array.Count / 2)
    $left = Sort-Merge -InputObject $array[0..($mid - 1)]
    $right = Sort-Merge -InputObject $array[$mid..($array.Count - 1)]

    return _Merge -Left $left -Right $right
}

function _Merge {
    param (
        [object[]]$Left,
        [object[]]$Right
    )

    $result = @()
    $i = 0
    $j = 0

    while ($i -lt $Left.Count -and $j -lt $Right.Count) {
        if ($Left[$i] -le $Right[$j]) {
            $result += $Left[$i]
            $i++
        } else {
            $result += $Right[$j]
            $j++
        }
    }

    if ($i -lt $Left.Count) {
        $result += $Left[$i..($Left.Count - 1)]
    }
    if ($j -lt $Right.Count) {
        $result += $Right[$j..($Right.Count - 1)]
    }

    return ,$result
}
