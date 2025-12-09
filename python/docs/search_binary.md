# search_binary.md - Binary Search Implementation

## Python Feature Introduction

二分探索は、ソート済みリストから効率的にターゲット値を探すアルゴリズムです。このPython実装では、左右のポインタを使って探索範囲を狭めています。

## Syntax Explanation

- **// 演算子**: 整数除算（切り捨て）
- **len()**: シーケンスの長さを返す
- **while left <= right**: 探索範囲が残っている間

## JavaScript Comparison

JavaScriptでの実装：
```javascript
function binarySearch(data, target) {
    let left = 0;
    let right = data.length - 1;
    
    while (left <= right) {
        const mid = Math.floor((left + right) / 2);
        if (data[mid] === target) {
            return mid;
        } else if (data[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1;
}
```

Pythonの方が//演算子で簡潔。

## Common Pitfalls for JS Developers

1. **// 演算子**: JavaScriptのMath.floor()に相当。
2. **len(data)**: JavaScriptのdata.lengthと同じ。
3. **ソート済み前提**: リストがソートされている必要がある。

## Code Walkthrough

```python
from typing import List, Any

def binary_search(data: List[int], target: int) -> int:
    """
    2分探索を用いてソート済みのリストからターゲットを探します。
    
    Args:
        data (List[int]): ソート済みの探索対象リスト
        target (int): 探索する値
        
    Returns:
        int: 見つかった場合はそのインデックス、見つからない場合は -1
    """
    left = 0
    right = len(data) - 1
    
    while left <= right:
        mid = (left + right) // 2
        if data[mid] == target:
            return mid
        elif data[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
            
    return -1
```

**Line-by-line explanation:**
- `left = 0; right = len(data) - 1`: 探索範囲の初期化。
- `while left <= right:`: 左が右以下である間ループ。
- `mid = (left + right) // 2`: 中間インデックスを計算。
- `if data[mid] == target:`: 中間値がターゲットと等しい場合。
- `elif data[mid] < target:`: 中間値がターゲットより小さい場合、左を移動。
- `else:`: 中間値がターゲットより大きい場合、右を移動。
- `return -1`: 見つからない場合。

## Type Hints Explanation

- `List[int]`: 整数のリスト
- `target: int`: 整数ターゲット

## Python-Specific Features

1. **// 演算子**: 整数除算
2. **len()関数**: 組み込み関数

## Key Differences from JavaScript

1. **// vs Math.floor()**: より簡潔
2. **len() vs .length**: 同じ機能
3. **型ヒント**: JavaScriptにはない

二分探索はO(log n)の効率的なアルゴリズムです。