# search_hash.md - Hash Search Implementation

## Python Feature Introduction

ハッシュ検索は、ハッシュ関数を使ってキーをインデックスに変換し、高速に検索を行うアルゴリズムです。このPython実装では、連鎖法（Chaining）を使って衝突を解決しています。

## Syntax Explanation

- **クラス定義**: class ClassName:
- **__init__**: コンストラクタ
- **self**: インスタンス参照
- **hash()**: 組み込みハッシュ関数
- **enumerate()**: インデックス付きイテレーション
- **del**: 要素削除

## JavaScript Comparison

JavaScriptでのハッシュテーブル（Mapを使用）：
```javascript
class HashTable {
    constructor(size = 10) {
        this.size = size;
        this.table = new Array(size).fill().map(() => []);
    }
    
    _hash(key) {
        return Math.abs(this._hashCode(key) % this.size);
    }
    
    insert(key, value) {
        const index = this._hash(key);
        const bucket = this.table[index];
        
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i][0] === key) {
                bucket[i] = [key, value];
                return;
            }
        }
        bucket.push([key, value]);
    }
    
    search(key) {
        const index = this._hash(key);
        const bucket = this.table[index];
        
        for (const [k, v] of bucket) {
            if (k === key) return v;
        }
        return null;
    }
}
```

Pythonの方がhash()関数が便利。

## Common Pitfalls for JS Developers

1. **hash()関数**: JavaScriptにはない組み込み関数。
2. **self**: JavaScriptのthisに相当。
3. **del**: 要素削除の構文。
4. **Optional**: Noneを返す場合の型ヒント。

## Code Walkthrough

```python
class HashTable:
    def __init__(self, size: int = 10):
        self.size = size
        self.table: List[List[Tuple[Any, Any]]] = [[] for _ in range(size)]

    def _hash(self, key: Any) -> int:
        return hash(key) % self.size

    def insert(self, key: Any, value: Any):
        index = self._hash(key)
        bucket = self.table[index]
        
        for i, (k, v) in enumerate(bucket):
            if k == key:
                bucket[i] = (key, value)
                return
        
        bucket.append((key, value))

    def search(self, key: Any) -> Optional[Any]:
        index = self._hash(key)
        bucket = self.table[index]
        
        for k, v in bucket:
            if k == key:
                return v
        
        return None

    def delete(self, key: Any) -> bool:
        index = self._hash(key)
        bucket = self.table[index]
        
        for i, (k, v) in enumerate(bucket):
            if k == key:
                del bucket[i]
                return True
        
        return False
```

**Line-by-line explanation:**
- `class HashTable:`: クラス定義。
- `def __init__(self, size: int = 10):`: コンストラクタ、デフォルト引数。
- `self.table: List[List[Tuple[Any, Any]]] = [[] for _ in range(size)]`: ネストリストの初期化。
- `def _hash(self, key: Any) -> int:`: プライベートメソッド。
- `return hash(key) % self.size`: ハッシュ値計算。
- `for i, (k, v) in enumerate(bucket):`: インデックスとタプルをアンパック。
- `bucket[i] = (key, value)`: 要素更新。
- `del bucket[i]`: 要素削除。

## Type Hints Explanation

- `List[List[Tuple[Any, Any]]]`: タプルのリストのリスト
- `Optional[Any]`: NoneまたはAny型

## Python-Specific Features

1. **hash()関数**: 組み込みハッシュ関数
2. **del文**: 要素削除
3. **enumerate()**: インデックス付きループ
4. **タプルアンパッキング**: (k, v) の分解

## Key Differences from JavaScript

1. **hash()**: 手動実装が必要
2. **self vs this**: 同じ概念だが構文不同
3. **del vs splice()**: より直接的
4. **型ヒント**: JavaScriptにはない

ハッシュテーブルは平均O(1)の検索性能を提供します。