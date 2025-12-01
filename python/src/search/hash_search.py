"""
連鎖法（Chaining）を用いたハッシュテーブルの実装モジュール

このモジュールは、ハッシュの衝突を連鎖法で解決するハッシュテーブルを
実装しています。平均O(1)の時間計算量でデータの操作が可能です。
"""

from typing import Any, List, Optional, Tuple


class HashTable:
    """
    連鎖法（Chaining）を用いたハッシュテーブルの実装
    
    ハッシュテーブルは、キーと値のペアを格納するデータ構造で、
    平均的な場合O(1)の時間計算量でデータの挿入、検索、削除が可能です。
    
    連鎖法とは、ハッシュの衝突（異なるキーが同じハッシュ値を持つこと）を
    解決するための手法の一つです。同じハッシュ値を持つ要素は、
    リストで連結して格納します。
    
    ハッシュテーブルの構造:
    - テーブル（リスト）: 固定サイズのリスト
    - バケット（bucket）: テーブルの各スロットに格納されるリスト
    - ハッシュ関数: キーをテーブルのインデックスに変換する関数
    
    時間計算量:
    - 平均: O(1) - ハッシュの衝突が少ない場合
    - 最悪: O(n) - 全てのキーが同じバケットに格納された場合
    
    Attributes:
        size (int): テーブルのサイズ（バケットの数）
        table (List[List[Tuple[Any, Any]]]): ハッシュテーブルの本体
    """
    
    def __init__(self, size: int = 10):
        """
        ハッシュテーブルを指定されたサイズで初期化します。
        
        Args:
            size (int): テーブルのサイズ（バケットの数）、デフォルトは10
        """
        # テーブルのサイズを保存
        self.size = size
        
        # テーブルを初期化
        # 各バケットは空のリストとして初期化される
        # リスト内包表記で各要素に独立した空リストを作成
        self.table: List[List[Tuple[Any, Any]]] = [[] for _ in range(size)]

    def _hash(self, key: Any) -> int:
        """
        キーからハッシュ値（テーブルのインデックス）を計算します。
        
        Pythonの組み込みhash()関数を使用し、テーブルサイズで割った余りを
        ハッシュ値とします。
        
        Args:
            key (Any): ハッシュ化するキー
            
        Returns:
            int: 0からsize-1の範囲のハッシュ値
        """
        # Pythonの組み込みhash()関数を使用してハッシュ値を計算
        # テーブルサイズで割った余りを取ることで、インデックスの範囲内に収める
        return hash(key) % self.size

    def insert(self, key: Any, value: Any):
        """
        キーと値のペアをハッシュテーブルに挿入します。
        同じキーが既に存在する場合は、値を更新します。
        
        Args:
            key (Any): 挿入するキー
            value (Any): 挿入する値
        """
        # キーのハッシュ値を計算し、対応するバケットを取得
        index = self._hash(key)
        bucket = self.table[index]
        
        # バケット内で同じキーを持つ要素を探す
        # enumerate でインデックスとタプル (key, value) を同時に取得
        for i, (k, v) in enumerate(bucket):
            if k == key:
                # 既存のキーが見つかった場合、値を更新して終了
                bucket[i] = (key, value)
                return
        
        # 同じキーが存在しない場合、新しい要素をバケットの末尾に追加
        bucket.append((key, value))

    def search(self, key: Any) -> Optional[Any]:
        """
        指定されたキーに対応する値を検索します。
        
        Args:
            key (Any): 検索するキー
            
        Returns:
            Optional[Any]: 見つかった場合は値、見つからない場合は None
        """
        # キーのハッシュ値を計算し、対応するバケットを取得
        index = self._hash(key)
        bucket = self.table[index]
        
        # バケット内で同じキーを持つ要素を探す
        for k, v in bucket:
            if k == key:
                # キーが見つかった場合、対応する値を返す
                return v
        
        # キーが見つからなかった場合は None を返す
        return None

    def delete(self, key: Any) -> bool:
        """
        指定されたキーに対応する要素を削除します。
        
        Args:
            key (Any): 削除するキー
            
        Returns:
            bool: 削除に成功した場合は True、キーが存在しない場合は False
        """
        # キーのハッシュ値を計算し、対応するバケットを取得
        index = self._hash(key)
        bucket = self.table[index]
        
        # バケット内で同じキーを持つ要素を探す
        for i, (k, v) in enumerate(bucket):
            if k == key:
                # キーが見つかった場合、その要素をリストから削除
                # del でインデックス i の要素を削除
                del bucket[i]
                return True
        
        # キーが見つからなかった場合は False を返す
        return False
