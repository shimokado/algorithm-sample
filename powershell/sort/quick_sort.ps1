function Sort-Quick {
    <#
    .SYNOPSIS
        クイックソートを用いて配列を昇順にソートします。
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
    if ($array.Count -le 1) {
        return ,$array
    }

    _Sort-QuickRecursive -Array $array -Low 0 -High ($array.Count - 1)
    return ,$array
}

function _Sort-QuickRecursive {
    param (
        [object[]]$Array,
        [int]$Low,
        [int]$High
    )

    if ($Low -lt $High) {
        $pi = _Get-Partition -Array $Array -Low $Low -High $High
        _Sort-QuickRecursive -Array $Array -Low $Low -High ($pi - 1)
        _Sort-QuickRecursive -Array $Array -Low ($pi + 1) -High $High
    }
}

function _Get-Partition {
    param (
        [object[]]$Array,
        [int]$Low,
        [int]$High
    )

    $pivot = $Array[$High]
    $i = $Low - 1

    for ($j = $Low; $j -lt $High; $j++) {
        if ($Array[$j] -le $pivot) {
            $i++
            $temp = $Array[$i]
            $Array[$i] = $Array[$j]
            $Array[$j] = $temp
        }
    }

    $temp = $Array[$i + 1]
    $Array[$i + 1] = $Array[$High]
    $Array[$High] = $temp

    return $i + 1
}
