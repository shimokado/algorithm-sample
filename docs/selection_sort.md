# 選択ソート (Selection Sort)

配列の未ソート部分から最小（または最大）の要素を選び出し、未ソート部分の先頭と交換していくソートアルゴリズムです。

## アルゴリズムの概要
1. 配列全体を未ソート部分とする。
2. 未ソート部分から最小の要素を探す。
3. 最小の要素を、未ソート部分の先頭要素と交換する。
4. 先頭要素をソート済み部分とし、残りを未ソート部分とする。
5. 未ソート部分がなくなるまで繰り返す。

## 計算量
- **時間計算量**: $O(n^2)$
  - 常に最小値を探すため、データの並び順に関わらず比較回数は同じ。
- **空間計算量**: $O(1)$ （内部ソート）
- **安定性**: 不安定なソート（実装によるが一般的ではない）

## 擬似コード
```
function selection_sort(list):
    n = length(list)
    for i from 0 to n - 1:
        min_index = i
        for j from i + 1 to n - 1:
            if list[j] < list[min_index]:
                min_index = j
        if min_index != i:
            swap(list[i], list[min_index])
    return list
```
