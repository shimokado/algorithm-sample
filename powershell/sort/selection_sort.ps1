<#
.SYNOPSIS
    選択ソートモジュール

.DESCRIPTION
    このモジュールは、未ソート部分から最小値を選択して配置することで
    配列をソートする選択ソートアルゴリズムを実装しています。

    時間計算量: O(n²) - 常に全ての比較を行う
    空間計算量: O(1) - 追加のメモリをほとんど使用しない
    安定性: 不安定（同じ値の要素の相対的な順序が保持されない場合がある）
#>

function Sort-Selection {
    <#
    .SYNOPSIS
        選択ソートを用いて配列を昇順にソートします。

    .DESCRIPTION
        選択ソートは、未ソート部分から最小値を「選択」し、
        ソート済み部分の末尾に移動させることを繰り返すアルゴリズムです。

        アルゴリズムの手順:
        1. 未ソート部分（最初は配列全体）から最小値を見つける
        2. 最小値を未ソート部分の先頭と交換
        3. ソート済み部分が1つ増える
        4. 配列全体がソート済みになるまで1-3を繰り返す

    .PARAMETER InputObject
        ソート対象の配列

    .OUTPUTS
        [object[]] ソートされた配列（元の配列のコピー）

    .EXAMPLE
        Sort-Selection -InputObject @(64, 34, 25, 12, 22, 11, 90)
        # 出力: @(11, 12, 22, 25, 34, 64, 90)
    #>
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [AllowEmptyCollection()]
        [object[]]$InputObject
    )

    # 配列のコピーを作成（元の配列を変更しないため）
    $array = $InputObject.Clone()
    $n = $array.Count

    # 要素が1つ以下の場合は既にソート済み
    if ($n -le 1) {
        return $array
    }

    # 外側のループ: 各位置に対して最小値を選択して配置
    # $i はソート済み部分の末尾のインデックス
    for ($i = 0; $i -lt $n; $i++) {
        # 未ソート部分の最小値のインデックスを追跡
        # 初期値は未ソート部分の先頭（$i番目）
        $minIndex = $i

        # 内側のループ: 未ソート部分から最小値を探す
        # $i+1 から末尾まで走査
        for ($j = $i + 1; $j -lt $n; $j++) {
            # より小さい要素が見つかった場合、$minIndexを更新
            if ($array[$j] -lt $array[$minIndex]) {
                $minIndex = $j
            }
        }

        # 最小値が現在の位置と異なる場合のみ交換
        # これにより不必要な交換を避ける
        if ($minIndex -ne $i) {
            # 一時変数を使った要素の交換
            $temp = $array[$i]
            $array[$i] = $array[$minIndex]
            $array[$minIndex] = $temp
        }
    }

    # ソート済みの配列を返す
    return ,$array
}
