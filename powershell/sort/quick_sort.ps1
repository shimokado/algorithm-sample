<#
.SYNOPSIS
    クイックソートモジュール

.DESCRIPTION
    このモジュールは、分割統治法を用いた高速なソートアルゴリズムである
    クイックソートを実装しています。

    時間計算量:
    - 平均: O(n log n)
    - 最悪: O(n²) - ピボットの選択が悪い場合（既にソート済みなど）
    空間計算量: O(log n) - 再帰呼び出しのスタック
    安定性: 不安定（同じ値の要素の相対的な順序が保持されない場合がある）
#>

function Sort-Quick {
    <#
    .SYNOPSIS
        クイックソートを用いて配列を昇順にソートします。

    .DESCRIPTION
        クイックソートは「分割統治法」を用いた高速なソートアルゴリズムです。
        ピボット（基準値）を選択し、配列をピボットより小さい要素と
        大きい要素に分割することを再帰的に繰り返します。

        アルゴリズムの手順:
        1. ピボットを選択（この実装では配列の最後の要素）
        2. ピボットより小さい要素を左側、大きい要素を右側に分割
        3. ピボットの左側と右側の部分配列に対して再帰的にソート

    .PARAMETER InputObject
        ソート対象の配列

    .OUTPUTS
        [object[]] ソートされた配列（元の配列のコピー）

    .EXAMPLE
        Sort-Quick -InputObject @(64, 34, 25, 12, 22, 11, 90)
        # 出力: @(11, 12, 22, 25, 34, 64, 90)
    #>
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [AllowEmptyCollection()]
        [object[]]$InputObject
    )

    # 配列のコピーを作成（元の配列を変更しないため）
    $array = $InputObject.Clone()

    # 要素が1つ以下の場合は既にソート済み
    if ($array.Count -le 1) {
        return ,$array
    }

    # 再帰的なクイックソートを実行
    # 初期の範囲は配列全体（インデックス0からCount-1まで）
    _Sort-QuickRecursive -Array $array -Low 0 -High ($array.Count - 1)

    # ソート済みの配列を返す
    return ,$array
}

<#
.SYNOPSIS
    クイックソートの再帰的な実装部分

.PARAMETER Array
    ソート対象の配列（参照渡し）

.PARAMETER Low
    ソート範囲の開始インデックス

.PARAMETER High
    ソート範囲の終了インデックス
#>
function _Sort-QuickRecursive {
    param (
        [object[]]$Array,
        [int]$Low,
        [int]$High
    )

    # ソート範囲に要素が2つ以上ある場合のみ処理
    # $Low >= $High の場合、要素が0または1つなので処理不要
    if ($Low -lt $High) {
        # 配列を分割し、ピボットの最終位置を取得
        $pi = _Get-Partition -Array $Array -Low $Low -High $High

        # ピボットの左側（ピボットより小さい要素）を再帰的にソート
        _Sort-QuickRecursive -Array $Array -Low $Low -High ($pi - 1)

        # ピボットの右側（ピボットより大きい要素）を再帰的にソート
        _Sort-QuickRecursive -Array $Array -Low ($pi + 1) -High $High
    }
}

<#
.SYNOPSIS
    配列を分割し、ピボットの最終位置を返す

.DESCRIPTION
    Lomutoのパーティションスキームを使用:
    - ピボットより小さい要素を左側に集める
    - ピボットより大きい要素を右側に集める

.PARAMETER Array
    分割対象の配列（参照渡し）

.PARAMETER Low
    分割範囲の開始インデックス

.PARAMETER High
    分割範囲の終了インデックス

.OUTPUTS
    [int] ピボットの最終位置
#>
function _Get-Partition {
    param (
        [object[]]$Array,
        [int]$Low,
        [int]$High
    )

    # ピボットとして配列の最後の要素を選択
    $pivot = $Array[$High]

    # $i はピボットより小さい要素の「境界」を追跡
    # $i+1 の位置に次の「小さい要素」が入る
    $i = $Low - 1

    # $Low から $High-1 までの各要素を確認
    for ($j = $Low; $j -lt $High; $j++) {
        # 現在の要素がピボット以下の場合
        if ($Array[$j] -le $pivot) {
            # 境界を1つ右に移動
            $i++
            # 境界位置と現在の要素を交換
            # これにより、小さい要素が左側に集まる
            $temp = $Array[$i]
            $Array[$i] = $Array[$j]
            $Array[$j] = $temp
        }
    }

    # ピボットを正しい位置（境界の次）に配置
    $temp = $Array[$i + 1]
    $Array[$i + 1] = $Array[$High]
    $Array[$High] = $temp

    # ピボットの最終位置を返す
    return $i + 1
}
