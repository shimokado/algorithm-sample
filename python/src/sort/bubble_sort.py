from typing import List, Any

def bubble_sort(data: List[Any]) -> List[Any]:
    """
    バブルソートを用いてリストを昇順にソートします。
    （リスト自体を変更します）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされたリスト
    """
    n = len(data)
    for i in range(n):
        # 既にソート済みの部分はスキップ
        for j in range(0, n - i - 1):
            if data[j] > data[j + 1]:
                data[j], data[j + 1] = data[j + 1], data[j]
    return data
