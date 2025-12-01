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
