"""
マージソートモジュール

このモジュールは、分割統治法を用いた安定なソートアルゴリズムである
マージソートを実装しています。
"""

from typing import List, Any


def merge_sort(data: List[Any]) -> List[Any]:
    """
    マージソートを用いてリストを昇順にソートします。
    （新しいリストを返します - 非破壊的メソッド）
    
    マージソートは「分割統治法」を用いた安定なソートアルゴリズムです。
    リストを再帰的に半分に分割し、ソート済みの部分リストを
    マージ（統合）することでソートを行います。
    
    アルゴリズムの手順:
    1. リストを半分に分割
    2. 各半分を再帰的にソート
    3. ソート済みの2つのリストをマージ
    
    時間計算量: O(n log n) - 常に同じ
    空間計算量: O(n) - マージ用の一時リストが必要
    安定性: 安定（同じ値の要素の相対的な順序が保持される）
    
    Args:
        data (List[Any]): ソート対象のリスト
        
    Returns:
        List[Any]: ソートされた新しいリスト（元のリストは変更されない）
    """
    # 基底ケース: 要素が1つ以下のリストは既にソート済み
    if len(data) <= 1:
        return data

    # リストの中央のインデックスを計算
    mid = len(data) // 2
    
    # リストを左半分と右半分に分割し、それぞれを再帰的にソート
    # data[:mid] で先頭からmid-1までを取得（左半分）
    left = merge_sort(data[:mid])
    # data[mid:] でmidから末尾までを取得（右半分）
    right = merge_sort(data[mid:])

    # ソート済みの左右のリストをマージして返す
    return _merge(left, right)


def _merge(left: List[Any], right: List[Any]) -> List[Any]:
    """
    2つのソート済みリストをマージして、1つのソート済みリストを返す
    
    Args:
        left (List[Any]): 左側のソート済みリスト
        right (List[Any]): 右側のソート済みリスト
        
    Returns:
        List[Any]: マージされたソート済みリスト
    """
    # マージ結果を格納するリスト
    result = []
    
    # 各リストの現在位置を追跡するインデックス
    i = j = 0
    
    # 両方のリストに要素が残っている間、小さい方を選んで追加
    while i < len(left) and j < len(right):
        # 左の要素が右の要素以下の場合
        if left[i] <= right[j]:
            # 左の要素を結果に追加
            result.append(left[i])
            i += 1
        else:
            # 右の要素を結果に追加
            result.append(right[j])
            j += 1
    
    # 残りの要素を結果に追加
    # left か right のどちらかに残りがある可能性がある
    # extend でリストの残りの要素を一括追加
    result.extend(left[i:])
    result.extend(right[j:])
    
    return result
