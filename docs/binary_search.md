# 2分探索 (Binary Search)

**ソート済み**の配列から、目的の要素を高速に探し出すアルゴリズムです。

## アルゴリズムの概要
探索範囲の中央の要素と目的の値を比較し、探索範囲を半分に絞り込みながら探索します。

1. 配列の中央の要素を見る。
2. 中央の要素が目的の値と一致すれば、探索終了（発見）。
3. 中央の要素 < 目的の値 なら、探索範囲を右半分（大きい方）に絞る。
4. 中央の要素 > 目的の値 なら、探索範囲を左半分（小さい方）に絞る。
5. 探索範囲がなくなるまで繰り返す。

## 計算量
- **時間計算量**: $O(\log n)$
- **空間計算量**: $O(1)$ （反復的実装の場合）

## 擬似コード
```
function binary_search(sorted_list, target):
    left = 0
    right = length(sorted_list) - 1
    
    while left <= right:
        mid = floor((left + right) / 2)
        if sorted_list[mid] == target:
            return mid
        else if sorted_list[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
            
    return -1
```
