function Sort-Insertion {
    <#
    .SYNOPSIS
        挿入ソートを用いて配列を昇順にソートします。
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

    $array = $InputObject.Clone()
    $n = $array.Count

    if ($n -le 1) {
        return $array
    }

    for ($i = 1; $i -lt $n; $i++) {
        $key = $array[$i]
        $j = $i - 1
        while ($j -ge 0 -and $array[$j] -gt $key) {
            $array[$j + 1] = $array[$j]
            $j--
        }
        $array[$j + 1] = $key
    }

    return ,$array
}
