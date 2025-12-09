# sort_selection.md - Selection Sort Implementation

## Python Feature Introduction

選択ソートは、最小値を見つけて適切な位置に置くことでリストをソートするアルゴリズムです。このPython実装では、in-placeソートを行っています。

## Syntax Explanation

- **range(start, stop)**: 開始と終了を指定したシーケンス
- **条件付き交換**: min_index != i の場合のみ交換

## JavaScript Comparison

JavaScriptでの実装：
```javascript
function selectionSort(data) {
    const n = data.length;
    for (let i = 0; i < n; i++) {
        let minIndex = i;
        for (let j = i + 1; j < n; j++) {
            if (data[j] < data[minIndex]) {
                minIndex = j;
            }
        }
        if (minIndex !== i) {
            [data[i], data[minIndex]] = [data[minIndex], data[i]];
        }
    }
    return data;
}
```

ほぼ同じ構造。

## Common Pitfalls for JS Developers

1. **range(i + 1, n)**: for (let j = i + 1; j < n; j++) と同じ。
2. **条件付き交換**: 不必要な交換を避ける。

## Code Walkthrough

```python
def selection_sort(data: List[Any]) -> List[Any]:
    """
    選択ソートを用いてリストを昇順にソートします。
    （リスト自体を変更します）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされたリスト
    """
    n = len(data)
    for i in range(n):
        min_index = i
        for j in range(i + 1, n):
            if data[j] < data[min_index]:
                min_index = j
        
        if min_index != i:
            data[i], data[min_index] = data[min_index], data[i]
            
    return data
```

**Line-by-line explanation:**
- `for i in range(n):`: 各位置について。
- `min_index = i`: 現在の最小インデックスをiに。
- `for j in range(i + 1, n):`: i+1からn-1まで。
- `if data[j] < data[min_index]:`: より小さい値を見つけたら。
- `min_index = j`: 最小インデックスを更新。
- `if min_index != i:`: 交換が必要なら。
- `data[i], data[min_index] = data[min_index], data[i]`: 交換。

## Type Hints Explanation

- `List[Any]`: 任意の型のリスト

## Python-Specific Features

1. **range(start, stop)**: 柔軟なシーケンス生成
2. **タプルアンパッキング**: 交換に便利

## Key Differences from JavaScript

1. **range()**: forループの初期化を簡略化
2. **!= vs !==**: Pythonでは!=で十分
3. **len()**: .lengthと同じ

選択ソートもO(n²)ですが、バブルソートより交換回数が少ないです。