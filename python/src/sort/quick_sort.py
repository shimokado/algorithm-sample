from typing import List, Any

def quick_sort(data: List[Any]) -> List[Any]:
    """
    クイックソートを用いてリストを昇順にソートします。
    （リスト自体を変更します）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされたリスト
    """
    _quick_sort_recursive(data, 0, len(data) - 1)
    return data

def _quick_sort_recursive(data: List[Any], low: int, high: int):
    if low < high:
        pi = _partition(data, low, high)
        _quick_sort_recursive(data, low, pi - 1)
        _quick_sort_recursive(data, pi + 1, high)

def _partition(data: List[Any], low: int, high: int) -> int:
    pivot = data[high]
    i = low - 1
    for j in range(low, high):
        if data[j] <= pivot:
            i += 1
            data[i], data[j] = data[j], data[i]
    data[i + 1], data[high] = data[high], data[i + 1]
    return i + 1
