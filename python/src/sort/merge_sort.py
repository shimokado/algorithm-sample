from typing import List, Any

def merge_sort(data: List[Any]) -> List[Any]:
    """
    マージソートを用いてリストを昇順にソートします。
    （新しいリストを返します）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされた新しいリスト
    """
    if len(data) <= 1:
        return data

    mid = len(data) // 2
    left = merge_sort(data[:mid])
    right = merge_sort(data[mid:])

    return _merge(left, right)

def _merge(left: List[Any], right: List[Any]) -> List[Any]:
    result = []
    i = j = 0
    
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
            
    result.extend(left[i:])
    result.extend(right[j:])
    return result
