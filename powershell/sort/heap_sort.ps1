function Sort-Heap {
    <#
    .SYNOPSIS
        ヒープソートを用いて配列を昇順にソートします。
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
        return ,$array
    }

    # Build heap
    for ($i = [math]::Floor($n / 2) - 1; $i -ge 0; $i--) {
        _Invoke-Heapify -Array $array -N $n -I $i
    }

    # Extract elements
    for ($i = $n - 1; $i -gt 0; $i--) {
        $temp = $array[0]
        $array[0] = $array[$i]
        $array[$i] = $temp

        _Invoke-Heapify -Array $array -N $i -I 0
    }

    return ,$array
}

function _Invoke-Heapify {
    param (
        [object[]]$Array,
        [int]$N,
        [int]$I
    )

    $largest = $I
    $l = 2 * $I + 1
    $r = 2 * $I + 2

    if ($l -lt $N -and $Array[$l] -gt $Array[$largest]) {
        $largest = $l
    }

    if ($r -lt $N -and $Array[$r] -gt $Array[$largest]) {
        $largest = $r
    }

    if ($largest -ne $I) {
        $temp = $Array[$I]
        $Array[$I] = $Array[$largest]
        $Array[$largest] = $temp

        _Invoke-Heapify -Array $Array -N $N -I $largest
    }
}
