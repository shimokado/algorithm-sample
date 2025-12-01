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
