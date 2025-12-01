from typing import Any, List, Optional, Tuple

class HashTable:
    """
    連鎖法（Chaining）を用いたハッシュテーブルの実装
    """
    def __init__(self, size: int = 10):
        self.size = size
        self.table: List[List[Tuple[Any, Any]]] = [[] for _ in range(size)]

    def _hash(self, key: Any) -> int:
        """ハッシュ関数: キーのハッシュ値をテーブルサイズで割った余りを返す"""
        return hash(key) % self.size

    def insert(self, key: Any, value: Any):
        """キーと値のペアを挿入する。キーが存在する場合は値を更新する。"""
        index = self._hash(key)
        bucket = self.table[index]
        
        for i, (k, v) in enumerate(bucket):
            if k == key:
                bucket[i] = (key, value)
                return
        
        bucket.append((key, value))

    def search(self, key: Any) -> Optional[Any]:
        """キーに対応する値を検索する。見つからない場合はNoneを返す。"""
        index = self._hash(key)
        bucket = self.table[index]
        
        for k, v in bucket:
            if k == key:
                return v
        
        return None

    def delete(self, key: Any) -> bool:
        """キーに対応する要素を削除する。削除できた場合はTrueを返す。"""
        index = self._hash(key)
        bucket = self.table[index]
        
        for i, (k, v) in enumerate(bucket):
            if k == key:
                del bucket[i]
                return True
        
        return False
