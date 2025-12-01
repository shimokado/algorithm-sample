from typing import List, Any

def heap_sort(data: List[Any]) -> List[Any]:
    """
    ヒープソートを用いてリストを昇順にソートします。
    （リスト自体を変更します）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされたリスト
    """
    n = len(data)

    # Build a maxheap.
    for i in range(n // 2 - 1, -1, -1):
        _heapify(data, n, i)

    # One by one extract elements
    for i in range(n - 1, 0, -1):
        data[i], data[0] = data[0], data[i]  # swap
        _heapify(data, i, 0)
        
    return data

def _heapify(data: List[Any], n: int, i: int):
    largest = i
    l = 2 * i + 1
    r = 2 * i + 2

    if l < n and data[l] > data[largest]:
        largest = l

    if r < n and data[r] > data[largest]:
        largest = r

    if largest != i:
        data[i], data[largest] = data[largest], data[i]
        _heapify(data, n, largest)
