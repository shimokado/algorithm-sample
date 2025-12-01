<#
.SYNOPSIS
    ヒープソートモジュール

.DESCRIPTION
    このモジュールは、二分ヒープのデータ構造を利用した
    ヒープソートアルゴリズムを実装しています。

    時間計算量: O(n log n) - 常に同じ
    空間計算量: O(1) - 追加のメモリをほとんど使用しない
    安定性: 不安定（同じ値の要素の相対的な順序が保持されない場合がある）
#>

function Sort-Heap {
    <#
    .SYNOPSIS
        ヒープソートを用いて配列を昇順にソートします。

    .DESCRIPTION
        ヒープソートは、二分ヒープ（完全二分木）のデータ構造を利用した
        ソートアルゴリズムです。まず配列を最大ヒープに変換し、
        ヒープから最大要素を取り出して配列の末尾に配置することを繰り返します。

        二分ヒープの性質:
        - 完全二分木である
        - 親ノードは子ノードより大きい（最大ヒープの場合）
        - 配列のインデックスで表現可能:
          - 親: ($i-1) / 2
          - 左の子: 2*$i + 1
          - 右の子: 2*$i + 2

        アルゴリズムの手順:
        1. 配列を最大ヒープに変換（heapify）
        2. ルート（最大値）を配列の末尾と交換
        3. ヒープサイズを1減らし、ヒープを再構築
        4. 全要素がソートされるまで2-3を繰り返す

    .PARAMETER InputObject
        ソート対象の配列

    .OUTPUTS
        [object[]] ソートされた配列（元の配列のコピー）

    .EXAMPLE
        Sort-Heap -InputObject @(64, 34, 25, 12, 22, 11, 90)
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
        return ,$array
    }

    # ステップ1: 配列を最大ヒープに変換（ヒープの構築）
    # 非リーフノードのみを処理すればよい
    # 最後の非リーフノードのインデックスは [math]::Floor($n/2) - 1
    # 下から上へ処理することで、効率的にヒープを構築できる
    for ($i = [math]::Floor($n / 2) - 1; $i -ge 0; $i--) {
        _Invoke-Heapify -Array $array -N $n -I $i
    }

    # ステップ2: ヒープから要素を1つずつ取り出してソート
    # 最大要素（ルート）を末尾に移動し、ヒープサイズを縮小
    for ($i = $n - 1; $i -gt 0; $i--) {
        # ルート（最大値）を現在の末尾と交換
        # これにより、最大値が正しい位置（末尾）に配置される
        $temp = $array[0]
        $array[0] = $array[$i]
        $array[$i] = $temp

        # 縮小されたヒープを再構築
        # ヒープサイズは $i（末尾の要素は除外）
        _Invoke-Heapify -Array $array -N $i -I 0
    }

    # ソート済みの配列を返す
    return ,$array
}

<#
.SYNOPSIS
    ヒープ条件を満たすように部分木を再構築する（ヒープ化）

.DESCRIPTION
    指定されたノード $I を根とする部分木を最大ヒープに変換します。
    子ノードは既にヒープ条件を満たしていることを前提とします。

.PARAMETER Array
    対象の配列（参照渡し）

.PARAMETER N
    ヒープとして扱う範囲（配列の先頭からN要素）

.PARAMETER I
    ヒープ化の対象となるノードのインデックス
#>
function _Invoke-Heapify {
    param (
        [object[]]$Array,
        [int]$N,
        [int]$I
    )

    # 最大値のインデックス（初期値は現在のノード）
    $largest = $I

    # 左の子のインデックスを計算
    $l = 2 * $I + 1
    # 右の子のインデックスを計算
    $r = 2 * $I + 2

    # 左の子が存在し、かつ親より大きい場合
    if ($l -lt $N -and $Array[$l] -gt $Array[$largest]) {
        $largest = $l
    }

    # 右の子が存在し、かつ現在の最大値より大きい場合
    if ($r -lt $N -and $Array[$r] -gt $Array[$largest]) {
        $largest = $r
    }

    # 最大値が親ノードでない場合、交換してヒープ条件を満たす
    if ($largest -ne $I) {
        # 親と最大の子を交換
        $temp = $Array[$I]
        $Array[$I] = $Array[$largest]
        $Array[$largest] = $temp

        # 交換された子ノードの部分木も再帰的にヒープ化
        # 交換によりヒープ条件が崩れた可能性があるため
        _Invoke-Heapify -Array $Array -N $N -I $largest
    }
}
