<#
.SYNOPSIS
    挿入ソートモジュール

.DESCRIPTION
    このモジュールは、各要素をソート済み部分の適切な位置に挿入することで
    配列をソートする挿入ソートアルゴリズムを実装しています。

    時間計算量: 
    - 最悪/平均: O(n²)
    - 最良: O(n) - 配列が既にソート済みの場合
    空間計算量: O(1) - 追加のメモリをほとんど使用しない
    安定性: 安定（同じ値の要素の相対的な順序が保持される）
#>

function Sort-Insertion {
    <#
    .SYNOPSIS
        挿入ソートを用いて配列を昇順にソートします。

    .DESCRIPTION
        挿入ソートは、トランプのカードを手に取って並べ替えるような
        直感的なソートアルゴリズムです。
        各要素を、既にソート済みの部分の適切な位置に「挿入」していきます。

        アルゴリズムの手順:
        1. 2番目の要素から順に処理を開始
        2. 現在の要素（key）を取り出す
        3. keyより大きいソート済み部分の要素を右にずらす
        4. keyを適切な位置に挿入
        5. 配列の末尾まで2-4を繰り返す

        小さな配列や、ほぼソート済みの配列に対して効率的です。

    .PARAMETER InputObject
        ソート対象の配列

    .OUTPUTS
        [object[]] ソートされた配列（元の配列のコピー）

    .EXAMPLE
        Sort-Insertion -InputObject @(64, 34, 25, 12, 22, 11, 90)
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

    # 外側のループ: 2番目の要素（インデックス1）から開始
    # 最初の要素（インデックス0）は、1要素だけのソート済み配列とみなす
    for ($i = 1; $i -lt $n; $i++) {
        # 挿入する要素（key）を保存
        # この要素をソート済み部分の適切な位置に挿入する
        $key = $array[$i]

        # ソート済み部分の末尾のインデックス
        $j = $i - 1

        # ソート済み部分を右から左に走査
        # keyより大きい要素を右に1つずつシフト
        while ($j -ge 0 -and $array[$j] -gt $key) {
            # 要素を右に1つシフト
            $array[$j + 1] = $array[$j]
            # 次の位置へ移動
            $j--
        }

        # keyを適切な位置に挿入
        # $j+1 の位置が、keyが入るべき場所
        $array[$j + 1] = $key
    }

    # ソート済みの配列を返す
    return ,$array
}
