# sort_heap.md - Heap Sort Implementation

## Python Feature Introduction

ヒープソートは、ヒープデータ構造を使ってリストをソートするアルゴリズムです。このPython実装では、最大ヒープを構築し、要素を順に抽出しています。

## Syntax Explanation

- **range(start, stop, step)**: ステップ付きシーケンス
- **ヒープ構造**: 完全二分木
- **_heapify**: ヒープ条件を維持する関数

## JavaScript Comparison

JavaScriptでの実装：
```javascript
function heapSort(data) {
    const n = data.length;
    
    // Build heap
    for (let i = Math.floor(n / 2) - 1; i >= 0; i--) {
        heapify(data, n, i);
    }
    
    // Extract elements
    for (let i = n - 1; i > 0; i--) {
        [data[0], data[i]] = [data[i], data[0]];
        heapify(data, i, 0);
    }
    return data;
}

function heapify(data, n, i) {
    let largest = i;
    const l = 2 * i + 1;
    const r = 2 * i + 2;
    
    if (l < n && data[l] > data[largest]) largest = l;
    if (r < n && data[r] > data[largest]) largest = r;
    
    if (largest !== i) {
        [data[i], data[largest]] = [data[largest], data[i]];
        heapify(data, n, largest);
    }
}
```

Pythonの方がrange()が便利。

## Common Pitfalls for JS Developers

1. **range(n // 2 - 1, -1, -1)**: 逆順ループ。
2. **ヒープインデックス**: 2*i + 1, 2*i + 2。
3. **再帰的heapify**: ヒープ条件を維持。

## Code Walkthrough

### heap_sort関数
```python
def heap_sort(data: List[Any]) -> List[Any]:
    n = len(data)

    # Build a maxheap.
    for i in range(n // 2 - 1, -1, -1):
        _heapify(data, n, i)

    # One by one extract elements
    for i in range(n - 1, 0, -1):
        data[i], data[0] = data[0], data[i]  # swap
        _heapify(data, i, 0)
        
    return data
```

**Line-by-line explanation:**
- `for i in range(n // 2 - 1, -1, -1):`: 葉ノードから根に向かってヒープ構築。
- `_heapify(data, n, i)`: 各ノードでヒープ条件を満たす。
- `for i in range(n - 1, 0, -1):`: 後ろから順に要素を抽出。
- `data[i], data[0] = data[0], data[i]`: 最大要素を末尾に移動。
- `_heapify(data, i, 0)`: 残りのヒープを再構築。

### _heapify関数
```python
def _heapify(data: List[Any], n: int, i: int):
    largest = i
    l = 2 * i + 1
    r = 2 * i + 2

    if l < n and data[l] > data[largest]:
        largest = l

    if r < n and data[r] > data[largest]:
        largest = r

    if largest != i:
        data[i], data[largest] = data[largest], data[i]
        _heapify(data, n, largest)
```

**Line-by-line explanation:**
- `largest = i`: 現在のノードを最大と仮定。
- `l = 2 * i + 1; r = 2 * i + 2`: 左右の子ノード。
- `if l < n and data[l] > data[largest]:`: 左の子が大きい場合。
- `if largest != i:`: 交換が必要なら。
- `_heapify(data, n, largest)`: 再帰的に下位を調整。

## Type Hints Explanation

- `List[Any]`: 任意の型のリスト
- `n: int, i: int`: サイズとインデックス

## Python-Specific Features

1. **range(start, stop, step)**: 逆順ループに便利
2. **//**: 整数除算

## Key Differences from JavaScript

1. **range()**: for (let i = ...; i >= 0; i--) の代わり
2. **//**: Math.floor() 不要
3. **タプルアンパッキング**: 分割代入と同じ

ヒープソートはO(n log n)の安定した性能です。