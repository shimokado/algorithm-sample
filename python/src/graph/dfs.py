from typing import Dict, List, Set, Any

def dfs_recursive(graph: Dict[Any, List[Any]], start: Any) -> List[Any]:
    """
    再帰を用いた深さ優先探索
    
    Args:
        graph: 隣接リスト表現のグラフ {node: [neighbors]}
        start: 開始ノード
        
    Returns:
        訪問順のノードリスト
    """
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

def dfs_iterative(graph: Dict[Any, List[Any]], start: Any) -> List[Any]:
    """
    スタックを用いた深さ優先探索（反復）
    
    Args:
        graph: 隣接リスト表現のグラフ {node: [neighbors]}
        start: 開始ノード
        
    Returns:
        訪問順のノードリスト
    """
    visited = set()
    result = []
    stack = [start]
    
    while stack:
        node = stack.pop()
        
        if node not in visited:
            visited.add(node)
            result.append(node)
            
            # スタックはLIFOなので、隣接リストを逆順に追加することで
            # 小さいインデックス/若い順序の隣接ノードから処理されるようにする
            if node in graph:
                for neighbor in reversed(graph[node]):
                    if neighbor not in visited:
                        stack.append(neighbor)
                        
    return result
