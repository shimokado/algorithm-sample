<#
.SYNOPSIS
    2分探索（バイナリサーチ）モジュール

.DESCRIPTION
    このモジュールは、ソート済み配列を対象とした効率的な探索アルゴリズム
    である2分探索を実装しています。

    時間計算量: O(log n) - 毎回探索範囲が半分になる
    空間計算量: O(1) - 反復版では追加のメモリをほとんど使用しない
#>

function Search-Binary {
    <#
    .SYNOPSIS
        2分探索を用いてソート済みの配列からターゲットを探します。

    .DESCRIPTION
        2分探索は、ソートされた配列を対象とした効率的な探索アルゴリズムです。
        配列の中央の要素とターゲットを比較し、探索範囲を半分に絞り込むことを繰り返します。

        アルゴリズムの手順:
        1. 探索範囲の中央の要素を取得
        2. 中央の要素とターゲットを比較
        3. 一致すれば探索終了
        4. ターゲットが中央より大きければ右半分を、小さければ左半分を新しい探索範囲とする
        5. 探索範囲がなくなるまで1-4を繰り返す

        注意: この関数は配列がソート済みであることを前提としています。
              ソートされていない配列で使用すると正しい結果が得られません。

    .PARAMETER InputObject
        ソート済みの探索対象配列（昇順）

    .PARAMETER Target
        探索する値

    .OUTPUTS
        [int] 見つかった場合はそのインデックス、見つからない場合は -1

    .EXAMPLE
        Search-Binary -InputObject @(1, 3, 5, 7, 9, 11, 13) -Target 7
        # 出力: 3
    #>
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [AllowEmptyCollection()]
        [object[]]$InputObject,

        [Parameter(Mandatory=$true)]
        [object]$Target
    )

    # 探索範囲の左端と右端のインデックスを初期化
    # 最初は配列全体が探索範囲
    $left = 0
    $right = $InputObject.Count - 1

    # 探索範囲が存在する間、繰り返す
    # $left > $right になったら探索範囲がなくなったことを意味する
    while ($left -le $right) {
        # 探索範囲の中央のインデックスを計算
        # [Math]::Floor で小数点以下を切り捨てて整数にする
        $mid = [Math]::Floor(($left + $right) / 2)
        
        # 中央の要素とターゲットを比較
        if ($InputObject[$mid] -eq $Target) {
            # ターゲットが見つかった場合、そのインデックスを返す
            return $mid
        } elseif ($InputObject[$mid] -lt $Target) {
            # 中央の要素がターゲットより小さい場合
            # ターゲットは右半分にあるので、左端を中央の次に移動
            $left = $mid + 1
        } else {
            # 中央の要素がターゲットより大きい場合
            # ターゲットは左半分にあるので、右端を中央の前に移動
            $right = $mid - 1
        }
    }

    # 探索範囲がなくなってもターゲットが見つからなかった場合は -1 を返す
    return -1
}
