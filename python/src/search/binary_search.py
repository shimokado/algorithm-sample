from typing import List, Any

def binary_search(data: List[int], target: int) -> int:
    """
    2分探索を用いてソート済みのリストからターゲットを探します。
    
    Args:
        data (List[int]): ソート済みの探索対象リスト
        target (int): 探索する値
        
    Returns:
        int: 見つかった場合はそのインデックス、見つからない場合は -1
    """
    left = 0
    right = len(data) - 1
    
    while left <= right:
        mid = (left + right) // 2
        if data[mid] == target:
            return mid
        elif data[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
            
    return -1
