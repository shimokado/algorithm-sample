"""
クイックソートモジュール

このモジュールは、分割統治法を用いた高速なソートアルゴリズムである
クイックソートを実装しています。
"""

from typing import List, Any


def quick_sort(data: List[Any]) -> List[Any]:
    """
    クイックソートを用いてリストを昇順にソートします。
    （リスト自体を変更します - 破壊的メソッド）
    
    クイックソートは「分割統治法」を用いた高速なソートアルゴリズムです。
    ピボット（基準値）を選択し、リストをピボットより小さい要素と
    大きい要素に分割することを再帰的に繰り返します。
    
    アルゴリズムの手順:
    1. ピボットを選択（この実装ではリストの最後の要素）
    2. ピボットより小さい要素を左側、大きい要素を右側に分割
    3. ピボットの左側と右側の部分リストに対して再帰的にソート
    
    時間計算量:
    - 平均: O(n log n)
    - 最悪: O(n²) - ピボットの選択が悪い場合（既にソート済みなど）
    空間計算量: O(log n) - 再帰呼び出しのスタック
    安定性: 不安定（同じ値の要素の相対的な順序が保持されない場合がある）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされたリスト（元のリストと同じ参照）
    """
    # 再帰的なクイックソートを実行
    # 初期の範囲はリスト全体（インデックス0からlen(data)-1まで）
    _quick_sort_recursive(data, 0, len(data) - 1)
    return data


def _quick_sort_recursive(data: List[Any], low: int, high: int):
    """
    クイックソートの再帰的な実装部分
    
    Args:
        data (List[Any]): ソート対象のリスト
        low (int): ソート範囲の開始インデックス
        high (int): ソート範囲の終了インデックス
    """
    # ソート範囲に要素が2つ以上ある場合のみ処理
    # low >= high の場合、要素が0または1つなので処理不要
    if low < high:
        # リストを分割し、ピボットの最終位置を取得
        pi = _partition(data, low, high)
        
        # ピボットの左側（ピボットより小さい要素）を再帰的にソート
        _quick_sort_recursive(data, low, pi - 1)
        
        # ピボットの右側（ピボットより大きい要素）を再帰的にソート
        _quick_sort_recursive(data, pi + 1, high)


def _partition(data: List[Any], low: int, high: int) -> int:
    """
    リストを分割し、ピボットの最終位置を返す
    
    Lomutoのパーティションスキームを使用:
    - ピボットより小さい要素を左側に集める
    - ピボットより大きい要素を右側に集める
    
    Args:
        data (List[Any]): 分割対象のリスト
        low (int): 分割範囲の開始インデックス
        high (int): 分割範囲の終了インデックス
        
    Returns:
        int: ピボットの最終位置
    """
    # ピボットとしてリストの最後の要素を選択
    pivot = data[high]
    
    # i はピボットより小さい要素の「境界」を追跡
    # i+1 の位置に次の「小さい要素」が入る
    i = low - 1
    
    # low から high-1 までの各要素を確認
    for j in range(low, high):
        # 現在の要素がピボット以下の場合
        if data[j] <= pivot:
            # 境界を1つ右に移動
            i += 1
            # 境界位置と現在の要素を交換
            # これにより、小さい要素が左側に集まる
            data[i], data[j] = data[j], data[i]
    
    # ピボットを正しい位置（境界の次）に配置
    data[i + 1], data[high] = data[high], data[i + 1]
    
    # ピボットの最終位置を返す
    return i + 1
