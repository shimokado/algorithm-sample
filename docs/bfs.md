# 幅優先探索 (Breadth-First Search, BFS)

グラフや木構造を探索するためのアルゴリズムの一つです。開始ノードから近いノードを全て探索してから、徐々に遠くのノードへ探索範囲を広げていきます。最短経路問題（重みなしグラフ）などでよく利用されます。

## アルゴリズムの概要
1. 探索開始ノードを訪問済みにし、キュー（Queue）に追加する。
2. キューが空になるまで以下の操作を繰り返す：
    a. キューからノードを一つ取り出す（デキュー）。
    b. 取り出したノードに隣接する未訪問のノードがあれば、全て訪問済みにし、キューに追加する（エンキュー）。

## 計算量
- **時間計算量**: $O(V + E)$
  - $V$: 頂点（ノード）の数
  - $E$: 辺（エッジ）の数
- **空間計算量**: $O(V)$
  - 訪問済みフラグの保持や、キューのため。

## 擬似コード
```
function bfs(graph, start_node):
    queue = [start_node]
    visited = {start_node: true}
    
    while queue is not empty:
        node = queue.dequeue()
        print node
        
        for neighbor in graph[node]:
            if not visited[neighbor]:
                visited[neighbor] = true
                queue.enqueue(neighbor)
```

## DFSとの違い
- **DFS (深さ優先)**: スタック（LIFO）を使用。深く深く突き進む。迷路探索などに適する。
- **BFS (幅優先)**: キュー（FIFO）を使用。浅く広く広がる。最短経路探索に適する。
