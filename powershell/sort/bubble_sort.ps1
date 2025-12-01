function Sort-Bubble {
    <#
    .SYNOPSIS
        バブルソートを用いて配列を昇順にソートします。
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

    # 配列のコピーを作成（元の配列を変更しないため）
    $array = $InputObject.Clone()
    $n = $array.Count

    if ($n -le 1) {
        return $array
    }

    for ($i = 0; $i -lt $n; $i++) {
        for ($j = 0; $j -lt $n - $i - 1; $j++) {
            if ($array[$j] -gt $array[$j + 1]) {
                $temp = $array[$j]
                $array[$j] = $array[$j + 1]
                $array[$j + 1] = $temp
            }
        }
    }

    return ,$array
}
