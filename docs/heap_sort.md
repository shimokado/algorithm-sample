# ヒープソート (Heap Sort)

ヒープ（二分ヒープ）というデータ構造を利用したソートアルゴリズムです。配列全体をヒープ構造にし、最大値（または最小値）を取り出して並べることでソートを行います。

## アルゴリズムの概要
1. 配列全体を最大ヒープ（親ノードが子ノードより大きい状態）にする。
2. ヒープの最大値（ルート要素）を、配列の末尾（未ソート部分の最後）と交換する。
3. ヒープサイズを1つ減らし、ルート要素に対してヒープ条件を満たすように再構築（Heapify）する。
4. ヒープサイズが1になるまで、手順2と3を繰り返す。

## 計算量
- **時間計算量**: $O(n \log n)$
  - ヒープ構築に $O(n)$、要素の取り出しと再構築に $O(\log n)$ を $n$ 回繰り返すため。
- **空間計算量**: $O(1)$ （内部ソート）
- **安定性**: 不安定なソート

## 擬似コード
```
function heap_sort(arr):
    n = length(arr)
    
    // Build max heap
    for i from n / 2 - 1 down to 0:
        heapify(arr, n, i)
        
    // Extract elements from heap one by one
    for i from n - 1 down to 0:
        swap(arr[0], arr[i])
        heapify(arr, i, 0)

function heapify(arr, n, i):
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2
    
    if left < n and arr[left] > arr[largest]:
        largest = left
        
    if right < n and arr[right] > arr[largest]:
        largest = right
        
    if largest != i:
        swap(arr[i], arr[largest])
        heapify(arr, n, largest)
```
