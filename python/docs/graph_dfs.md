# graph_dfs.md - Depth-First Search (DFS) Implementation

## Python Feature Introduction

深さ優先探索（DFS）は、グラフを深さ方向に探索するアルゴリズムです。このPython実装では、再帰版と反復版の両方を示しています。Pythonのネスト関数やスタック操作を活用しています。

## Syntax Explanation

- **ネスト関数**: 関数内で関数を定義
- **再帰**: 関数が自身を呼び出す
- **スタック**: LIFO（後入れ先出し）構造
- **reversed()**: シーケンスを逆順にイテレート

## JavaScript Comparison

JavaScriptでの再帰版：
```javascript
function dfsRecursive(graph, start, visited = new Set(), result = []) {
    visited.add(start);
    result.push(start);
    
    if (graph[start]) {
        for (const neighbor of graph[start]) {
            if (!visited.has(neighbor)) {
                dfsRecursive(graph, neighbor, visited, result);
            }
        }
    }
    return result;
}
```

反復版：
```javascript
function dfsIterative(graph, start) {
    const visited = new Set();
    const result = [];
    const stack = [start];
    
    while (stack.length > 0) {
        const node = stack.pop();
        
        if (!visited.has(node)) {
            visited.add(node);
            result.push(node);
            
            if (graph[node]) {
                for (const neighbor of graph[node].slice().reverse()) {
                    stack.push(neighbor);
                }
            }
        }
    }
    return result;
}
```

## Common Pitfalls for JS Developers

1. **再帰の制限**: Pythonでも再帰はスタックオーバーフローする可能性がある。
2. **reversed()**: JavaScriptではslice().reverse()を使う。
3. **ネスト関数**: 関数内で関数を定義可能。

## Code Walkthrough

### 再帰版
```python
def dfs_recursive(graph: Dict[Any, List[Any]], start: Any) -> List[Any]:
    visited = set()
    result = []
    
    def _dfs(node):
        visited.add(node)
        result.append(node)
        
        if node in graph:
            for neighbor in graph[node]:
                if neighbor not in visited:
                    _dfs(neighbor)
                    
    _dfs(start)
    return result
```

**Line-by-line explanation:**
- `def _dfs(node):`: ネスト関数。ヘルパー関数。
- `visited.add(node); result.append(node)`: ノードを訪問済みにし、結果に追加。
- `for neighbor in graph[node]:`: 隣接ノードをループ。
- `_dfs(neighbor)`: 再帰呼び出し。

### 反復版
```python
def dfs_iterative(graph: Dict[Any, List[Any]], start: Any) -> List[Any]:
    visited = set()
    result = []
    stack = [start]
    
    while stack:
        node = stack.pop()
        
        if node not in visited:
            visited.add(node)
            result.append(node)
            
            if node in graph:
                for neighbor in reversed(graph[node]):
                    stack.append(neighbor)
                    
    return result
```

**Line-by-line explanation:**
- `stack = [start]`: スタックを初期化。
- `node = stack.pop()`: スタックからノードを取り出す。
- `if node not in visited:`: 未訪問の場合のみ処理。
- `for neighbor in reversed(graph[node]):`: 逆順で隣接ノードをスタックに追加。

## Type Hints Explanation

- `Dict[Any, List[Any]]`: グラフの型
- `List[Any]`: 結果のリスト

## Python-Specific Features

1. **ネスト関数**: 関数内の関数定義
2. **reversed()**: 逆順イテレーション
3. **set**: 集合操作

## Key Differences from JavaScript

1. **ネスト関数**: JavaScriptでも可能だが、Pythonの方が自然
2. **reversed()**: slice().reverse() より簡潔
3. **while stack**: stack.length > 0 より簡潔
4. **再帰**: 同じように使用可能

DFSはグラフ探索の基本的なアルゴリズムです。