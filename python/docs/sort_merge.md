# sort_merge.md - Merge Sort Implementation

## Python Feature Introduction

マージソートは、分割統治法を使ってリストをソートする効率的なアルゴリズムです。このPython実装では、再帰を使ってリストを分割し、マージ関数で結合しています。

## Syntax Explanation

- **再帰**: 関数が自身を呼び出す
- **スライス**: data[:mid], data[mid:]
- **extend()**: リストに別のリストを追加

## JavaScript Comparison

JavaScriptでの実装：
```javascript
function mergeSort(data) {
    if (data.length <= 1) return data;
    
    const mid = Math.floor(data.length / 2);
    const left = mergeSort(data.slice(0, mid));
    const right = mergeSort(data.slice(mid));
    
    return merge(left, right);
}

function merge(left, right) {
    const result = [];
    let i = 0, j = 0;
    
    while (i < left.length && j < right.length) {
        if (left[i] <= right[j]) {
            result.push(left[i]);
            i++;
        } else {
            result.push(right[j]);
            j++;
        }
    }
    
    return result.concat(left.slice(i), right.slice(j));
}
```

Pythonの方がスライスが簡潔。

## Common Pitfalls for JS Developers

1. **スライス**: data[:mid] は data.slice(0, mid) と同じ。
2. **再帰**: 同じように使用。
3. **extend()**: concat() に相当。

## Code Walkthrough

### merge_sort関数
```python
def merge_sort(data: List[Any]) -> List[Any]:
    if len(data) <= 1:
        return data

    mid = len(data) // 2
    left = merge_sort(data[:mid])
    right = merge_sort(data[mid:])

    return _merge(left, right)
```

**Line-by-line explanation:**
- `if len(data) <= 1: return data`: ベースケース。
- `mid = len(data) // 2`: 中間点を計算。
- `left = merge_sort(data[:mid])`: 左半分を再帰ソート。
- `right = merge_sort(data[mid:])`: 右半分を再帰ソート。
- `return _merge(left, right)`: マージした結果を返す。

### _merge関数
```python
def _merge(left: List[Any], right: List[Any]) -> List[Any]:
    result = []
    i = j = 0
    
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
            
    result.extend(left[i:])
    result.extend(right[j:])
    return result
```

**Line-by-line explanation:**
- `i = j = 0`: インデックス初期化。
- `while i < len(left) and j < len(right):`: 両方のリストに要素がある間。
- `if left[i] <= right[j]:`: 左の方が小さいか等しい場合。
- `result.extend(left[i:])`: 残りの左リストを追加。
- `result.extend(right[j:])`: 残りの右リストを追加。

## Type Hints Explanation

- `List[Any]`: 任意の型のリスト

## Python-Specific Features

1. **スライス**: data[:mid] で簡潔
2. **extend()**: リスト拡張
3. **多重代入**: i = j = 0

## Key Differences from JavaScript

1. **スライス**: slice() より簡潔
2. **extend()**: concat() より直接的
3. **//**: Math.floor() 不要

マージソートはO(n log n)の安定ソートです。