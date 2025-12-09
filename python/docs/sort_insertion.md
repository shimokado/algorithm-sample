# sort_insertion.md - Insertion Sort Implementation

## Python Feature Introduction

挿入ソートは、要素を一つずつ取り出して適切な位置に挿入することでリストをソートするアルゴリズムです。このPython実装では、in-placeソートを行っています。

## Syntax Explanation

- **key = data[i]**: 挿入する要素を保存
- **while j >= 0 and data[j] > key**: 条件付きループ
- **data[j + 1] = data[j]**: 要素を右にシフト

## JavaScript Comparison

JavaScriptでの実装：
```javascript
function insertionSort(data) {
    const n = data.length;
    for (let i = 1; i < n; i++) {
        const key = data[i];
        let j = i - 1;
        while (j >= 0 && data[j] > key) {
            data[j + 1] = data[j];
            j--;
        }
        data[j + 1] = key;
    }
    return data;
}
```

構造が同じ。

## Common Pitfalls for JS Developers

1. **while条件**: j >= 0 && data[j] > key と同じ。
2. **j -= 1**: j-- と同じ。
3. **keyの保存**: 一時変数が必要。

## Code Walkthrough

```python
def insertion_sort(data: List[Any]) -> List[Any]:
    """
    挿入ソートを用いてリストを昇順にソートします。
    （リスト自体を変更します）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされたリスト
    """
    n = len(data)
    for i in range(1, n):
        key = data[i]
        j = i - 1
        while j >= 0 and data[j] > key:
            data[j + 1] = data[j]
            j -= 1
        data[j + 1] = key
            
    return data
```

**Line-by-line explanation:**
- `for i in range(1, n):`: 1からn-1まで。
- `key = data[i]`: 挿入する要素を保存。
- `j = i - 1`: 比較する位置。
- `while j >= 0 and data[j] > key:`: 左にシフトする必要がある間。
- `data[j + 1] = data[j]`: 要素を右に移動。
- `j -= 1`: jをデクリメント。
- `data[j + 1] = key`: keyを適切な位置に挿入。

## Type Hints Explanation

- `List[Any]`: 任意の型のリスト

## Python-Specific Features

1. **range(1, n)**: 1から開始
2. **while条件**: 簡潔な論理式

## Key Differences from JavaScript

1. **range()**: for (let i = 1; i < n; i++) の代わり
2. **j -= 1**: j-- と同じ
3. **条件**: 同じ論理演算子

挿入ソートはほぼソート済みのリストで効率的です。