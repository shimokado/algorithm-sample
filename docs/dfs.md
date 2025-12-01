# 深さ優先探索 (Depth-First Search, DFS)

グラフや木構造を探索するためのアルゴリズムの一つです。現在のノードから遷移可能なノードの一つを選んで進めるだけ進み、行き止まりになったら一つ手前のノードに戻って別のルートを探索します。

## アルゴリズムの概要
1. 探索開始ノードを訪問済みにし、スタックに積む（または再帰呼び出しを行う）。
2. 現在のノードに隣接する未訪問のノードがあれば、そのノードに移動し、1の手順を繰り返す。
3. 隣接する未訪問ノードがなければ、一つ前のノードに戻る（バックトラック）。
4. 全てのノードを訪問するまで繰り返す。

## 計算量
- **時間計算量**: $O(V + E)$
  - $V$: 頂点（ノード）の数
  - $E$: 辺（エッジ）の数
- **空間計算量**: $O(V)$
  - 訪問済みフラグの保持や、再帰スタック（または明示的なスタック）のため。

## 擬似コード（再帰）
```
function dfs(graph, current_node, visited):
    visited[current_node] = true
    print current_node
    
    for neighbor in graph[current_node]:
        if not visited[neighbor]:
            dfs(graph, neighbor, visited)
```

## 擬似コード（スタック）
```
function dfs_stack(graph, start_node):
    stack = [start_node]
    visited = {}
    
    while stack is not empty:
        node = stack.pop()
        
        if not visited[node]:
            visited[node] = true
            print node
            
            // スタックなので逆順に追加すると、隣接リストの順序通りに処理されやすい
            for neighbor in reverse(graph[node]):
                if not visited[neighbor]:
                    stack.push(neighbor)
```
