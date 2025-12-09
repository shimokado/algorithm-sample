# search_linear.md - Linear Search Implementation

## Python Feature Introduction

線形探索は、リストからターゲット値を順番に探すシンプルなアルゴリズムです。このPython実装では、enumerate()関数を使ってインデックスと値を同時に取得しています。

## Syntax Explanation

- **enumerate()**: インデックスと値を同時に返すイテレータ
- **for i, value in enumerate(data)**: インデックスと値をアンパック
- **return -1**: 見つからない場合の慣習

## JavaScript Comparison

JavaScriptでの実装：
```javascript
function linearSearch(data, target) {
    for (let i = 0; i < data.length; i++) {
        if (data[i] === target) {
            return i;
        }
    }
    return -1;
}
```

Pythonの方が簡潔です。

## Common Pitfalls for JS Developers

1. **enumerate()**: JavaScriptにはない。forループでiを別途管理する必要がある。
2. **for i, value in**: タプルアンパッキングでインデックスと値を取得。

## Code Walkthrough

```python
from typing import List, Any, Optional

def linear_search(data: List[Any], target: Any) -> int:
    """
    線形探索を用いてリストからターゲットを探します。
    
    Args:
        data (List[Any]): 探索対象のリスト
        target (Any): 探索する値
        
    Returns:
        int: 見つかった場合はそのインデックス、見つからない場合は -1
    """
    for i, value in enumerate(data):
        if value == target:
            return i
    return -1
```

**Line-by-line explanation:**
- `from typing import List, Any, Optional`: 型ヒントをインポート。
- `def linear_search(data: List[Any], target: Any) -> int:`: 関数定義。
- `for i, value in enumerate(data):`: dataの各要素について、インデックスiと値valueを取得。
- `if value == target:`: 値がターゲットと等しいかチェック。
- `return i`: 見つかったインデックスを返す。
- `return -1`: 見つからない場合。

## Type Hints Explanation

- `List[Any]`: 任意の型のリスト
- `Any`: 型を指定しない
- `-> int`: 戻り値は整数

## Python-Specific Features

1. **enumerate()**: インデックス付きイテレーション
2. **タプルアンパッキング**: i, value = enumerate()の結果

## Key Differences from JavaScript

1. **enumerate()**: for (let i = 0; i < arr.length; i++) の代わり
2. **for i, value in**: より簡潔な構文
3. **== vs ===**: Pythonでは==で値比較

このアルゴリズムはシンプルですが、大きなリストでは非効率的です。