"""
深さ優先探索（DFS: Depth-First Search）モジュール

このモジュールは、グラフや木構造を探索するための深さ優先探索アルゴリズムを
再帰版と反復版の両方で実装しています。
"""

from typing import Dict, List, Set, Any


def dfs_recursive(graph: Dict[Any, List[Any]], start: Any) -> List[Any]:
    """
    再帰を用いた深さ優先探索（DFS: Depth-First Search）
    
    深さ優先探索は、グラフや木構造を探索するアルゴリズムの一つです。
    現在のノードから可能な限り深く進み、行き止まりに達したら
    戻って別の経路を探索します。
    
    この実装では、再帰呼び出しを使用してDFSを実現しています。
    再帰のコールスタックが暗黙的にスタックの役割を果たします。
    
    特徴:
    - 迷路の解探索やパズルの解法に適している
    - メモリ使用量が探索の深さに比例
    - 最短経路を見つけることは保証されない
    
    時間計算量: O(V + E) - Vはノード数、Eはエッジ数
    空間計算量: O(V) - 訪問済みセット + 再帰のスタック
    
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
    
    def _dfs(node):
        """
        内部再帰関数: 指定されたノードから深さ優先探索を行う
        
        Args:
            node: 現在のノード
        """
        # 現在のノードを訪問済みとしてマーク
        visited.add(node)
        # 訪問順序に追加
        result.append(node)
        
        # 現在のノードに隣接ノードが存在する場合
        if node in graph:
            # 全ての隣接ノードを順番に処理
            for neighbor in graph[node]:
                # まだ訪問していないノードのみ再帰的に探索
                if neighbor not in visited:
                    _dfs(neighbor)
    
    # 開始ノードからDFSを開始
    _dfs(start)
    return result


def dfs_iterative(graph: Dict[Any, List[Any]], start: Any) -> List[Any]:
    """
    スタックを用いた深さ優先探索（反復版）
    
    再帰を使わず、明示的なスタックを使用してDFSを実現します。
    再帰版と同じ結果を得るために、隣接ノードを逆順でスタックに追加します。
    
    再帰版との違い:
    - スタックオーバーフローのリスクがない
    - デバッグがしやすい
    - 状態を明示的に管理できる
    
    時間計算量: O(V + E) - Vはノード数、Eはエッジ数
    空間計算量: O(V) - 訪問済みセット + スタック
    
    Args:
        graph: 隣接リスト表現のグラフ {node: [neighbors]}
        start: 開始ノード
        
    Returns:
        訪問順のノードリスト
    """
    # 訪問済みノードを記録するセット
    visited = set()
    
    # 訪問順序を記録するリスト
    result = []
    
    # 探索するノードを管理するスタック
    # 開始ノードをスタックに追加
    stack = [start]
    
    # スタックが空になるまで探索を続ける
    while stack:
        # スタックの末尾からノードを取り出す（LIFO: 後入れ先出し）
        # Pythonのリストの pop() は末尾から要素を取り出す
        node = stack.pop()
        
        # まだ訪問していないノードの場合のみ処理
        if node not in visited:
            # 訪問済みとしてマーク
            visited.add(node)
            # 訪問順序に追加
            result.append(node)
            
            # 隣接ノードが存在する場合
            # スタックはLIFO（後入れ先出し）なので、
            # 再帰版と同じ訪問順序にするために隣接リストを逆順に追加
            # 例: [A, B, C] を逆順に追加 → Aが最初にpopされる
            if node in graph:
                for neighbor in reversed(graph[node]):
                    # まだ訪問していないノードのみスタックに追加
                    if neighbor not in visited:
                        stack.append(neighbor)
                        
    return result
