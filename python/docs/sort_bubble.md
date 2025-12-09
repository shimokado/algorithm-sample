# sort_bubble.md - Bubble Sort Implementation

## Python Feature Introduction

バブルソートは、隣接する要素を比較して交換することでリストをソートするシンプルなアルゴリズムです。このPython実装では、in-placeソートを行っています。

## Syntax Explanation

- **range()**: 数値シーケンスを生成
- **タプルアンパッキング**: a, b = b, a で交換
- **in-place操作**: 元のリストを変更

## JavaScript Comparison

JavaScriptでの実装：
```javascript
function bubbleSort(data) {
    const n = data.length;
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n - i - 1; j++) {
            if (data[j] > data[j + 1]) {
                [data[j], data[j + 1]] = [data[j + 1], data[j]];
            }
        }
    }
    return data;
}
```

PythonとJavaScriptで似た構文。

## Common Pitfalls for JS Developers

1. **range()**: for (let j = 0; j < n - i - 1; j++) と同じ。
2. **タプルアンパッキング**: JavaScriptの分割代入と同じ。
3. **in-place**: 元の配列を変更する。

## Code Walkthrough

```python
def bubble_sort(data: List[Any]) -> List[Any]:
    """
    バブルソートを用いてリストを昇順にソートします。
    （リスト自体を変更します）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされたリスト
    """
    n = len(data)
    for i in range(n):
        # 既にソート済みの部分はスキップ
        for j in range(0, n - i - 1):
            if data[j] > data[j + 1]:
                data[j], data[j + 1] = data[j + 1], data[j]
    return data
```

**Line-by-line explanation:**
- `n = len(data)`: リストの長さを取得。
- `for i in range(n):`: 外側のループ、n回繰り返す。
- `for j in range(0, n - i - 1):`: 内側のループ、未ソート部分を比較。
- `if data[j] > data[j + 1]:`: 隣接要素を比較。
- `data[j], data[j + 1] = data[j + 1], data[j]`: タプルアンパッキングで交換。

## Type Hints Explanation

- `List[Any]`: 任意の型のリスト

## Python-Specific Features

1. **range()**: 簡潔な数値シーケンス
2. **タプルアンパッキング**: 一時変数なしの交換

## Key Differences from JavaScript

1. **range() vs forループ**: より宣言的
2. **タプルアンパッキング**: 同じ構文
3. **len() vs .length**: 同じ機能

バブルソートはO(n²)のアルゴリズムで、小さなリストに適しています。