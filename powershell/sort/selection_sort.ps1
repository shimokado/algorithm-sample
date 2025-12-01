function Sort-Selection {
    <#
    .SYNOPSIS
        選択ソートを用いて配列を昇順にソートします。
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

    for ($i = 0; $i -lt $n; $i++) {
        $minIndex = $i
        for ($j = $i + 1; $j -lt $n; $j++) {
            if ($array[$j] -lt $array[$minIndex]) {
                $minIndex = $j
            }
        }

        if ($minIndex -ne $i) {
            $temp = $array[$i]
            $array[$i] = $array[$minIndex]
            $array[$minIndex] = $temp
        }
    }

    return ,$array
}
