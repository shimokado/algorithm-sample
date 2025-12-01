from typing import List, Any

def selection_sort(data: List[Any]) -> List[Any]:
    """
    選択ソートを用いてリストを昇順にソートします。
    （リスト自体を変更します）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされたリスト
    """
    n = len(data)
    for i in range(n):
        min_index = i
        for j in range(i + 1, n):
            if data[j] < data[min_index]:
                min_index = j
        
        if min_index != i:
            data[i], data[min_index] = data[min_index], data[i]
            
    return data
