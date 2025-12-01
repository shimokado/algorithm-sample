# ハッシュ探索法 (Hash Search)

ハッシュ関数を用いてデータを格納する位置（インデックス）を決定し、探索時間を $O(1)$ に近づける探索アルゴリズムです。

## アルゴリズムの概要
1. **ハッシュ関数**: キー（探索対象のデータ）を配列のインデックスに変換する関数 $h(key)$ を用意する。
2. **格納（Insert）**: データ $x$ を配列の $h(x)$ 番目に格納する。
3. **探索（Search）**: 探索したいデータ $k$ があるか調べるには、配列の $h(k)$ 番目を確認する。

### 衝突（Collision）の解決
異なるキーが同じインデックスになること（$h(k_1) = h(k_2)$）を「衝突」と呼びます。
主な解決策：
- **連鎖法（Chaining）**: 各インデックスにリスト（連結リストなど）を持たせ、衝突したデータをリストに追加する。
- **オープンアドレス法（Open Addressing）**: 衝突した場合、別の空いているインデックスを探して格納する。

本サンプルでは、**連鎖法**を用いたハッシュテーブルを実装します。

## 計算量
- **時間計算量**:
  - 平均: $O(1)$ （ハッシュ関数が適切で、データが分散している場合）
  - 最悪: $O(n)$ （全てのデータが同じインデックスに衝突した場合）
- **空間計算量**: $O(n)$

## 擬似コード（連鎖法）
```
class HashTable:
    function init(size):
        table = array of size, each element is an empty list
        
    function hash(key):
        return key % size
        
    function insert(key, value):
        index = hash(key)
        search list at table[index] for key
        if found:
            update value
        else:
            append (key, value) to table[index]
            
    function search(key):
        index = hash(key)
        search list at table[index] for key
        if found:
            return value
        else:
            return null
```
