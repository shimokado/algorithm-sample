"""
幅優先探索（BFS: Breadth-First Search）モジュール

このモジュールは、グラフや木構造を探索するための幅優先探索アルゴリズムを
実装しています。キューを使用してレベル順に探索を行います。
"""

from typing import Dict, List, Any
from collections import deque


def bfs(graph: Dict[Any, List[Any]], start: Any) -> List[Any]:
    """
    幅優先探索（BFS: Breadth-First Search）
    
    幅優先探索は、グラフや木構造を探索するアルゴリズムの一つです。
    開始ノードから近い順（階層順）にノードを訪問していきます。
    
    アルゴリズムの手順:
    1. 開始ノードをキューに追加し、訪問済みとしてマーク
    2. キューから先頭のノードを取り出す
    3. そのノードの未訪問の隣接ノードを全てキューに追加し、訪問済みとしてマーク
    4. キューが空になるまで2-3を繰り返す
    
    特徴:
    - 最短経路問題に適している（重み無しグラフの場合）
    - レベル順に探索するため、近いノードから優先的に訪問
    - DFSと比較してメモリ使用量が多くなる場合がある
    
    時間計算量: O(V + E) - Vはノード数、Eはエッジ数
    空間計算量: O(V) - 訪問済みセット + キュー
    
    Args:
        graph: 隣接リスト表現のグラフ {node: [neighbors]}
        start: 開始ノード
        
    Returns:
        訪問順のノードリスト
    """
    # 訪問済みノードを記録するセット
    # set を使用することで、O(1) で訪問済みかどうかを確認できる
    visited = set()
    
    # 訪問順序を記録するリスト
    result = []
    
    # 探索するノードを管理するキュー
    # collections.deque を使用することで、左端からの取り出しがO(1)になる
    # リストの pop(0) は O(n) なので、大きなグラフでは deque が効率的
    queue = deque([start])
    
    # 開始ノードを訪問済みとしてマーク
    # BFSでは、キューに追加する時点で訪問済みとしてマークする
    # これにより、同じノードが複数回キューに追加されることを防ぐ
    visited.add(start)
    
    # キューが空になるまで探索を続ける
    while queue:
        # キューの先頭からノードを取り出す（FIFO: 先入れ先出し）
        # popleft() でO(1)で先頭要素を取り出す
        node = queue.popleft()
        
        # 取り出したノードを訪問順序に追加
        result.append(node)
        
        # 現在のノードに隣接ノードが存在する場合
        if node in graph:
            # 全ての隣接ノードを順番に処理
            for neighbor in graph[node]:
                # まだ訪問していないノードのみ処理
                if neighbor not in visited:
                    # 訪問済みとしてマーク（キュー追加時にマークすることが重要）
                    visited.add(neighbor)
                    # キューの末尾に追加
                    queue.append(neighbor)
                    
    return result
