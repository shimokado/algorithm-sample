# sort_quick.md - Quick Sort Implementation

## Python Feature Introduction

クイックソートは、ピボット要素を選んでリストを分割しながらソートする効率的なアルゴリズムです。このPython実装では、in-placeソートを行っています。

## Syntax Explanation

- **再帰関数**: ヘルパー関数で再帰
- **パーティション**: ピボットより小さい要素を左に
- **in-place交換**: タプルアンパッキング

## JavaScript Comparison

JavaScriptでの実装：
```javascript
function quickSort(data, low = 0, high = data.length - 1) {
    if (low < high) {
        const pi = partition(data, low, high);
        quickSort(data, low, pi - 1);
        quickSort(data, pi + 1, high);
    }
}

function partition(data, low, high) {
    const pivot = data[high];
    let i = low - 1;
    
    for (let j = low; j < high; j++) {
        if (data[j] <= pivot) {
            i++;
            [data[i], data[j]] = [data[j], data[i]];
        }
    }
    [data[i + 1], data[high]] = [data[high], data[i + 1]];
    return i + 1;
}
```

構造が同じ。

## Common Pitfalls for JS Developers

1. **再帰**: スタックオーバーフローに注意。
2. **in-place**: 元の配列を変更。
3. **ピボット選択**: 最後の要素をピボットに。

## Code Walkthrough

### quick_sort関数
```python
def quick_sort(data: List[Any]) -> List[Any]:
    _quick_sort_recursive(data, 0, len(data) - 1)
    return data
```

**Line-by-line explanation:**
- `_quick_sort_recursive(data, 0, len(data) - 1)`: 再帰関数を呼び出し。

### _quick_sort_recursive関数
```python
def _quick_sort_recursive(data: List[Any], low: int, high: int):
    if low < high:
        pi = _partition(data, low, high)
        _quick_sort_recursive(data, low, pi - 1)
        _quick_sort_recursive(data, pi + 1, high)
```

**Line-by-line explanation:**
- `if low < high:`: 要素が2つ以上ある場合。
- `pi = _partition(data, low, high)`: パーティションを実行。
- 左右の部分を再帰ソート。

### _partition関数
```python
def _partition(data: List[Any], low: int, high: int) -> int:
    pivot = data[high]
    i = low - 1
    for j in range(low, high):
        if data[j] <= pivot:
            i += 1
            data[i], data[j] = data[j], data[i]
    data[i + 1], data[high] = data[high], data[i + 1]
    return i + 1
```

**Line-by-line explanation:**
- `pivot = data[high]`: 最後の要素をピボットに。
- `i = low - 1`: 小さい要素の境界。
- `for j in range(low, high):`: ピボット以外をループ。
- `if data[j] <= pivot:`: ピボット以下なら交換。
- `data[i + 1], data[high] = data[high], data[i + 1]`: ピボットを正位置に。

## Type Hints Explanation

- `List[Any]`: 任意の型のリスト
- `low: int, high: int`: インデックス

## Python-Specific Features

1. **range(low, high)**: 柔軟なループ
2. **タプルアンパッキング**: 交換に便利

## Key Differences from JavaScript

1. **range()**: for (let j = low; j < high; j++) の代わり
2. **タプルアンパッキング**: 分割代入と同じ
3. **関数定義**: 同じ

クイックソートは平均O(n log n)ですが、最悪O(n²)です。