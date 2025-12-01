<#
.SYNOPSIS
    マージソートモジュール

.DESCRIPTION
    このモジュールは、分割統治法を用いた安定なソートアルゴリズムである
    マージソートを実装しています。

    時間計算量: O(n log n) - 常に同じ
    空間計算量: O(n) - マージ用の一時配列が必要
    安定性: 安定（同じ値の要素の相対的な順序が保持される）
#>

function Sort-Merge {
    <#
    .SYNOPSIS
        マージソートを用いて配列を昇順にソートします。

    .DESCRIPTION
        マージソートは「分割統治法」を用いた安定なソートアルゴリズムです。
        配列を再帰的に半分に分割し、ソート済みの部分配列を
        マージ（統合）することでソートを行います。

        アルゴリズムの手順:
        1. 配列を半分に分割
        2. 各半分を再帰的にソート
        3. ソート済みの2つの配列をマージ

    .PARAMETER InputObject
        ソート対象の配列

    .OUTPUTS
        [object[]] ソートされた新しい配列（元の配列は変更されない）

    .EXAMPLE
        Sort-Merge -InputObject @(64, 34, 25, 12, 22, 11, 90)
        # 出力: @(11, 12, 22, 25, 34, 64, 90)
    #>
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [AllowEmptyCollection()]
        [object[]]$InputObject
    )

    $array = $InputObject

    # 基底ケース: 要素が1つ以下の配列は既にソート済み
    if ($array.Count -le 1) {
        return ,$array
    }

    # 配列の中央のインデックスを計算
    $mid = [math]::Floor($array.Count / 2)

    # 配列を左半分と右半分に分割し、それぞれを再帰的にソート
    # [0..($mid - 1)] で先頭からmid-1までを取得（左半分）
    $left = Sort-Merge -InputObject $array[0..($mid - 1)]
    # [$mid..($array.Count - 1)] でmidから末尾までを取得（右半分）
    $right = Sort-Merge -InputObject $array[$mid..($array.Count - 1)]

    # ソート済みの左右の配列をマージして返す
    return _Merge -Left $left -Right $right
}

<#
.SYNOPSIS
    2つのソート済み配列をマージして、1つのソート済み配列を返す

.PARAMETER Left
    左側のソート済み配列

.PARAMETER Right
    右側のソート済み配列

.OUTPUTS
    [object[]] マージされたソート済み配列
#>
function _Merge {
    param (
        [object[]]$Left,
        [object[]]$Right
    )

    # マージ結果を格納する配列
    $result = @()

    # 各配列の現在位置を追跡するインデックス
    $i = 0  # Left配列のインデックス
    $j = 0  # Right配列のインデックス

    # 両方の配列に要素が残っている間、小さい方を選んで追加
    while ($i -lt $Left.Count -and $j -lt $Right.Count) {
        # 左の要素が右の要素以下の場合
        if ($Left[$i] -le $Right[$j]) {
            # 左の要素を結果に追加
            $result += $Left[$i]
            $i++
        } else {
            # 右の要素を結果に追加
            $result += $Right[$j]
            $j++
        }
    }

    # 残りの要素を結果に追加
    # Left か Right のどちらかに残りがある可能性がある
    if ($i -lt $Left.Count) {
        # Left配列に残りの要素がある場合、一括追加
        $result += $Left[$i..($Left.Count - 1)]
    }
    if ($j -lt $Right.Count) {
        # Right配列に残りの要素がある場合、一括追加
        $result += $Right[$j..($Right.Count - 1)]
    }

    # マージされた配列を返す
    return ,$result
}
