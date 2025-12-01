from typing import List, Any

def insertion_sort(data: List[Any]) -> List[Any]:
    """
    挿入ソートを用いてリストを昇順にソートします。
    （リスト自体を変更します）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされたリスト
    """
    n = len(data)
    for i in range(1, n):
        key = data[i]
        j = i - 1
        while j >= 0 and data[j] > key:
            data[j + 1] = data[j]
            j -= 1
        data[j + 1] = key
            
    return data
