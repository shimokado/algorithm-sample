# クイックソート (Quick Sort)

分割統治法を用いた高速なソートアルゴリズムです。基準となる要素（ピボット）を選び、それより小さい要素と大きい要素に分割（パーティション）することを再帰的に繰り返してソートを行います。

## アルゴリズムの概要
1. 配列から要素を一つ選び、これを**ピボット**（基準値）とする。
2. ピボットより小さい要素を左側に、大きい要素を右側に移動させる（パーティション操作）。
3. 分割された左右の部分配列に対して、再帰的に同じ操作を行う。
4. 部分配列の要素数が1以下になったら終了。

## 計算量
- **時間計算量**:
  - 平均: $O(n \log n)$
  - 最悪: $O(n^2)$ （すでにソートされている場合などで、ピボットの選び方が悪い場合）
- **空間計算量**: $O(\log n)$ （再帰呼び出しのスタック領域）
- **安定性**: 不安定なソート

## 擬似コード
```
function quick_sort(list):
    if length(list) <= 1:
        return list
    
    pivot = select_pivot(list)
    left = []
    right = []
    equal = []
    
    for x in list:
        if x < pivot:
            add x to left
        else if x > pivot:
            add x to right
        else:
            add x to equal
            
    return concatenate(quick_sort(left), equal, quick_sort(right))
```
※ 上記は理解しやすいリスト内包表記的な実装ですが、メモリ効率を良くするためにインプレース（配列内での交換）で実装することが一般的です。

### インプレース版のパーティション操作
```
function partition(arr, low, high):
    pivot = arr[high]
    i = low - 1
    for j from low to high - 1:
        if arr[j] <= pivot:
            i = i + 1
            swap(arr[i], arr[j])
    swap(arr[i + 1], arr[high])
    return i + 1

function quick_sort_inplace(arr, low, high):
    if low < high:
        pi = partition(arr, low, high)
        quick_sort_inplace(arr, low, pi - 1)
        quick_sort_inplace(arr, pi + 1, high)
```
