# マージソート (Merge Sort)

分割統治法を用いた安定なソートアルゴリズムです。配列を半分に分割し、それぞれを再帰的にソートした後、それらをマージ（併合）して一つのソート済み配列にします。

## アルゴリズムの概要
1. 配列の要素数が1以下なら、すでにソート済みとみなして終了。
2. 配列を真ん中で2つの部分配列（左・右）に分割する。
3. 左右の部分配列に対して、再帰的にマージソートを適用する。
4. ソートされた左右の部分配列を、順序を保ちながらマージ（結合）する。

## 計算量
- **時間計算量**: $O(n \log n)$
  - 分割の深さが $\log n$、各階層でのマージ操作が $O(n)$。
  - 最悪、平均、最良ともに $O(n \log n)$ で安定している。
- **空間計算量**: $O(n)$
  - マージ操作のために一時的な配列が必要となるため。
- **安定性**: 安定なソート

## 擬似コード
```
function merge_sort(list):
    if length(list) <= 1:
        return list
    
    mid = length(list) / 2
    left = merge_sort(list[0...mid])
    right = merge_sort(list[mid...end])
    
    return merge(left, right)

function merge(left, right):
    result = []
    while length(left) > 0 and length(right) > 0:
        if left[0] <= right[0]:
            append left[0] to result
            remove first element from left
        else:
            append right[0] to result
            remove first element from right
            
    if length(left) > 0:
        append left to result
    if length(right) > 0:
        append right to result
        
    return result
```
