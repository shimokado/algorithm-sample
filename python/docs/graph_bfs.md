# graph_bfs.md - Breadth-First Search (BFS) Implementation

## Python Feature Introduction

幅優先探索（BFS）は、グラフをレベル順に探索するアルゴリズムです。このPython実装では、collections.dequeを使って効率的なキューを実装し、setで訪問済みノードを管理しています。

## Syntax Explanation

- **collections.deque**: 両端キュー。効率的な追加/削除が可能
- **set**: 重複のないコレクション。高速な検索
- **Dict**: キーと値のマッピング
- **while queue**: キューが空でない間ループ

## JavaScript Comparison

JavaScriptでの同様の実装：
```javascript
function bfs(graph, start) {
    const visited = new Set();
    const result = [];
    const queue = [start];
    
    visited.add(start);
    
    while (queue.length > 0) {
        const node = queue.shift();
        result.push(node);
        
        if (graph[node]) {
            for (const neighbor of graph[node]) {
                if (!visited.has(neighbor)) {
                    visited.add(neighbor);
                    queue.push(neighbor);
                }
            }
        }
    }
    return result;
}
```

Pythonの方がdequeを使って効率的です。

## Common Pitfalls for JS Developers

1. **dequeの使用**: JavaScriptの配列より効率的なキュー操作。
2. **setの操作**: add()で追加、inで存在チェック。
3. **Dictの操作**: JavaScriptのオブジェクトと同じように使用可能。

## Code Walkthrough

```python
from typing import Dict, List, Any
from collections import deque

def bfs(graph: Dict[Any, List[Any]], start: Any) -> List[Any]:
    """
    幅優先探索 (BFS)
    
    Args:
        graph: 隣接リスト表現のグラフ {node: [neighbors]}
        start: 開始ノード
        
    Returns:
        訪問順のノードリスト
    """
    visited = set()
    result = []
    queue = deque([start])
    
    visited.add(start)
    
    while queue:
        node = queue.popleft()
        result.append(node)
        
        if node in graph:
            for neighbor in graph[node]:
                if neighbor not in visited:
                    visited.add(neighbor)
                    queue.append(neighbor)
                    
    return result
```

**Line-by-line explanation:**
- `from collections import deque`: dequeをインポート。
- `def bfs(graph: Dict[Any, List[Any]], start: Any) -> List[Any]:`: 関数定義。graphは辞書、startは任意の型。
- `visited = set()`: 訪問済みノードを格納するセット。
- `queue = deque([start])`: 開始ノードを入れたキュー。
- `visited.add(start)`: 開始ノードを訪問済みに。
- `while queue:`: キューが空でない間ループ。
- `node = queue.popleft()`: キューの先頭を取り出す。
- `result.append(node)`: 結果リストに追加。
- `if node in graph:`: ノードがグラフに存在するかチェック。
- `for neighbor in graph[node]:`: 隣接ノードをループ。
- `if neighbor not in visited:`: 未訪問なら。
- `visited.add(neighbor); queue.append(neighbor)`: 訪問済みに追加し、キューに入れる。

## Type Hints Explanation

- `Dict[Any, List[Any]]`: 任意の型のキーと値（リスト）の辞書
- `List[Any]`: 任意の型のリスト
- `Any`: 型を指定しない場合に使用

## Python-Specific Features

1. **collections.deque**: 効率的な両端キュー
2. **set**: 高速な集合操作
3. **in演算子**: 辞書やセットでの存在チェック

## Key Differences from JavaScript

1. **deque**: JavaScriptの配列より効率的なキュー
2. **set**: JavaScriptのSetと同じだが、操作が異なる
3. **Dict**: JavaScriptのオブジェクトに似ているが、型ヒント可能
4. **while queue**: queue.length > 0 より簡潔

この実装はPythonのデータ構造を効果的に活用しています。