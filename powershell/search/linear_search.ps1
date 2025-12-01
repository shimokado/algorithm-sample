<#
.SYNOPSIS
    線形探索（リニアサーチ）モジュール

.DESCRIPTION
    このモジュールは、配列の先頭から順番に要素を探索する
    最も基本的な探索アルゴリズムを実装しています。

    時間計算量: O(n) - 最悪の場合、全要素を確認する必要がある
    空間計算量: O(1) - 追加のメモリをほとんど使用しない
#>

function Search-Linear {
    <#
    .SYNOPSIS
        線形探索を用いて配列からターゲットを探します。

    .DESCRIPTION
        線形探索は最も単純な探索アルゴリズムで、配列の先頭から順番に
        各要素をターゲットと比較していきます。

        特徴:
        - ソートされていない配列でも使用可能
        - 実装が簡単
        - 小さな配列では効率的
        - 大きな配列では2分探索などの方が効率的

    .PARAMETER InputObject
        探索対象の配列（ソートされていなくてもよい）

    .PARAMETER Target
        探索する値

    .OUTPUTS
        [int] 見つかった場合はそのインデックス（0から始まる）、見つからない場合は -1

    .EXAMPLE
        Search-Linear -InputObject @(1, 3, 5, 7, 9) -Target 5
        # 出力: 2
    #>
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [AllowEmptyCollection()]
        [object[]]$InputObject,

        [Parameter(Mandatory=$true)]
        [object]$Target
    )

    # 配列の先頭（インデックス0）から末尾まで順番に探索
    for ($i = 0; $i -lt $InputObject.Count; $i++) {
        # 現在の要素がターゲットと一致するか確認
        # -eq 演算子を使用して比較
        if ($InputObject[$i] -eq $Target) {
            # 一致した場合、そのインデックスを返して探索終了
            return $i
        }
    }

    # 配列の全要素を確認しても見つからなかった場合は -1 を返す
    # -1 は「見つからなかった」ことを示す慣例的な値
    return -1
}
