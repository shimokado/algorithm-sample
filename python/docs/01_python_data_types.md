# データ型と操作 - JavaScript開発者向け

Pythonのデータ型とその操作方法を、JavaScriptと比較しながら解説します。特に **Pythonらしいショートハンド** に焦点を当てます。

---

## 📋 リスト（List）= JavaScriptの配列

### 基本操作

**JavaScript:**
```javascript
const numbers = [1, 2, 3, 4, 5];
numbers.push(6);
numbers.length;  // 6
```

**Python:**
```python
numbers = [1, 2, 3, 4, 5]
numbers.append(6)
len(numbers)  # 6
```

---

### リストの作成方法

```python
# 空のリスト
empty = []
empty = list()

# 初期値ありのリスト
numbers = [1, 2, 3, 4, 5]

# 同じ値で初期化
zeros = [0] * 5  # [0, 0, 0, 0, 0]

# 🔥 Pythonらしいショートハンド: リスト内包表記
squares = [x ** 2 for x in range(5)]  # [0, 1, 4, 9, 16]
```

---

### リストへのアクセスとスライス

**インデックスアクセス:**
```python
numbers = [10, 20, 30, 40, 50]

# 正のインデックス
print(numbers[0])   # 10
print(numbers[2])   # 30

# 負のインデックス（末尾から）
print(numbers[-1])  # 50（最後の要素）
print(numbers[-2])  # 40（最後から2番目）
```

**🔥 スライス記法（Pythonの強力な機能）:**
```python
numbers = [10, 20, 30, 40, 50]

# [開始:終了]  終了インデックスは含まない
numbers[1:3]    # [20, 30]
numbers[:3]     # [10, 20, 30]  先頭から
numbers[2:]     # [30, 40, 50]  2番目から最後まで
numbers[:]      # [10, 20, 30, 40, 50]  全体のコピー

# [開始:終了:ステップ]
numbers[::2]    # [10, 30, 50]  2つおき
numbers[::-1]   # [50, 40, 30, 20, 10]  逆順！
numbers[1::2]   # [20, 40]  1番目から2つおき
```

> **JavaScriptとの比較:**
> ```javascript
> // JavaScript
> const numbers = [10, 20, 30, 40, 50];
> numbers.slice(1, 3);  // [20, 30]
> numbers.reverse();    // 元の配列を変更
> [...numbers].reverse();  // コピーして逆順
> ```

---

### リストの主なメソッド

```python
numbers = [3, 1, 4, 1, 5]

# 要素の追加
numbers.append(9)        # 末尾に追加: [3, 1, 4, 1, 5, 9]
numbers.insert(0, 2)     # インデックス0に挿入: [2, 3, 1, 4, 1, 5, 9]
numbers.extend([2, 6])   # 複数追加: [2, 3, 1, 4, 1, 5, 9, 2, 6]

# 要素の削除
numbers.remove(1)        # 最初の1を削除
popped = numbers.pop()   # 末尾を削除して返す
popped = numbers.pop(0)  # インデックス0を削除して返す
del numbers[0]           # インデックス0を削除（値は返さない）

# 検索
index = numbers.index(4)  # 4のインデックスを返す
count = numbers.count(1)  # 1の出現回数

# ソート
numbers.sort()            # 昇順ソート（元のリストを変更）
numbers.sort(reverse=True)  # 降順ソート
sorted_list = sorted(numbers)  # 新しいソート済みリストを返す

# 逆順
numbers.reverse()         # 元のリストを逆順に（変更）
reversed_list = numbers[::-1]  # 新しい逆順リスト
```

---

### 🔥 リスト内包表記（List Comprehension）

Pythonの最も強力な機能の一つ！

**基本形式:**
```python
# JavaScript
const squares = numbers.map(x => x ** 2);

# Python
squares = [x ** 2 for x in numbers]
```

**条件付きリスト内包表記:**
```python
# 偶数のみ
numbers = [1, 2, 3, 4, 5, 6]
evens = [x for x in numbers if x % 2 == 0]  # [2, 4, 6]

# 変換と条件を組み合わせ
doubled_evens = [x * 2 for x in numbers if x % 2 == 0]  # [4, 8, 12]

# if-else付き（三項演算子）
result = [x if x % 2 == 0 else -x for x in numbers]
# [1, 2, -3, 4, -5, 6]
```

**ネストしたリスト内包表記:**
```python
# 2次元リストの平坦化
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
flat = [num for row in matrix for num in row]
# [1, 2, 3, 4, 5, 6, 7, 8, 9]

# JavaScript equivalent:
# const flat = matrix.flatMap(row => row);
# または
# const flat = matrix.reduce((acc, row) => acc.concat(row), []);
```

---

## 🗂️ 辞書（Dictionary）= JavaScriptのオブジェクト

### 基本操作

**JavaScript:**
```javascript
const user = {
    name: "Alice",
    age: 25,
    city: "Tokyo"
};
```

**Python:**
```python
user = {
    "name": "Alice",
    "age": 25,
    "city": "Tokyo"
}
```

---

### 辞書の作成と操作

```python
# 空の辞書
empty = {}
empty = dict()

# キーと値のペアで作成
user = {"name": "Alice", "age": 25}

# dict()関数を使用
user = dict(name="Alice", age=25)

# 値の取得
name = user["name"]           # キーが存在しない場合はKeyError
name = user.get("name")       # キーが存在しない場合はNone
name = user.get("name", "Guest")  # デフォルト値を指定

# 値の設定
user["city"] = "Tokyo"
user["age"] = 26  # 上書き

# 値の削除
del user["city"]
age = user.pop("age")  # 削除して値を返す

# キーの存在確認
if "name" in user:
    print(user["name"])
```

---

### 辞書のメソッド

```python
user = {"name": "Alice", "age": 25, "city": "Tokyo"}

# キー、値、ペアの取得
keys = user.keys()      # dict_keys(['name', 'age', 'city'])
values = user.values()  # dict_values(['Alice', 25, 'Tokyo'])
items = user.items()    # dict_items([('name', 'Alice'), ('age', 25), ('city', 'Tokyo')])

# マージ
user.update({"country": "Japan", "age": 26})
# {"name": "Alice", "age": 26, "city": "Tokyo", "country": "Japan"}

# Python 3.9+: マージ演算子
user1 = {"name": "Alice"}
user2 = {"age": 25}
merged = user1 | user2  # {"name": "Alice", "age": 25}
```

---

### 🔥 辞書内包表記（Dict Comprehension）

```python
# 基本形
squares = {x: x ** 2 for x in range(5)}
# {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}

# 条件付き
even_squares = {x: x ** 2 for x in range(10) if x % 2 == 0}
# {0: 0, 2: 4, 4: 16, 6: 36, 8: 64}

# リストから辞書を作成
names = ["Alice", "Bob", "Charlie"]
name_lengths = {name: len(name) for name in names}
# {"Alice": 5, "Bob": 3, "Charlie": 7}

# キーと値を入れ替え
original = {"a": 1, "b": 2, "c": 3}
swapped = {v: k for k, v in original.items()}
# {1: "a", 2: "b", 3: "c"}
```

---

### 辞書のループ

```python
user = {"name": "Alice", "age": 25, "city": "Tokyo"}

# キーのみループ
for key in user:
    print(key)

# 値のみループ
for value in user.values():
    print(value)

# 🔥 キーと値の両方をループ（Pythonらしい!）
for key, value in user.items():
    print(f"{key}: {value}")

# name: Alice
# age: 25
# city: Tokyo
```

---

## 🎯 セット（Set）= JavaScriptのSet

### 基本操作

**JavaScript:**
```javascript
const numbers = new Set([1, 2, 3, 4, 5]);
numbers.add(6);
numbers.has(3);  // true
```

**Python:**
```python
numbers = {1, 2, 3, 4, 5}  # 波括弧でSet
numbers.add(6)
3 in numbers  # True
```

> **注意**: `{}` は空の辞書です。空のセットは `set()` で作成します。

---

### セットの操作

```python
# 作成
numbers = {1, 2, 3, 4, 5}
empty = set()  # 空のセット

# リストからセット（重複削除）
numbers = set([1, 2, 2, 3, 3, 3])  # {1, 2, 3}

# 要素の追加と削除
numbers.add(6)
numbers.remove(3)    # 存在しない場合はKeyError
numbers.discard(3)   # 存在しない場合もエラーなし

# 集合演算
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}

union = a | b         # 和集合: {1, 2, 3, 4, 5, 6}
intersection = a & b  # 積集合: {3, 4}
difference = a - b    # 差集合: {1, 2}
sym_diff = a ^ b      # 対称差: {1, 2, 5, 6}
```

---

### 🔥 セット内包表記

```python
# 基本形
squares = {x ** 2 for x in range(5)}  # {0, 1, 4, 9, 16}

# 条件付き
even_squares = {x ** 2 for x in range(10) if x % 2 == 0}
```

---

## 📦 タプル（Tuple）= イミュータブルなリスト

### 基本操作

タプルは **変更不可能（イミュータブル）** なシーケンスです。

```python
# 作成
coordinates = (10, 20)
point = 10, 20  # カッコ省略可能
single = (42,)  # 要素1つの場合はカンマ必要

# アクセス（リストと同じ）
x = coordinates[0]  # 10
y = coordinates[1]  # 20

# 変更不可
# coordinates[0] = 15  # TypeError!
```

---

### 🔥 タプルアンパック（Tuple Unpacking）

Pythonの超重要な機能！

**基本:**
```python
# 複数の値を一度に代入
x, y = (10, 20)
print(x)  # 10
print(y)  # 20

# カッコ省略可能
x, y = 10, 20

# 関数から複数の値を返す
def get_coordinates():
    return 10, 20  # タプルを返す

x, y = get_coordinates()
```

**変数の交換（Pythonらしい!）:**
```python
# JavaScript
let a = 1;
let b = 2;
[a, b] = [b, a];  # 分割代入

# Python（超シンプル！）
a = 1
b = 2
a, b = b, a  # 🔥 1行で交換!
```

**🌟 このプロジェクトでの実例:**
```python
# python/src/basic_math/gcd.py から
while b:
    a, b = b, a % b  # 🔥 同時に複数の変数を更新!

# これをJavaScriptで書くと
while (b) {
    const temp = a % b;
    a = b;
    b = temp;
}
```

**拡張アンパック（Python 3+）:**
```python
# 先頭と残り
first, *rest = [1, 2, 3, 4, 5]
# first = 1, rest = [2, 3, 4, 5]

# 末尾と残り
*rest, last = [1, 2, 3, 4, 5]
# rest = [1, 2, 3, 4], last = 5

# 真ん中と両端
first, *middle, last = [1, 2, 3, 4, 5]
# first = 1, middle = [2, 3, 4], last = 5
```

---

## 🔢 range() - 数値シーケンス

JavaScriptにはない、Pythonの便利な機能です。

**基本:**
```python
# range(終了)  0から開始、終了は含まない
list(range(5))          # [0, 1, 2, 3, 4]

# range(開始, 終了)
list(range(2, 6))       # [2, 3, 4, 5]

# range(開始, 終了, ステップ)
list(range(0, 10, 2))   # [0, 2, 4, 6, 8]
list(range(10, 0, -1))  # [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
```

**使用例:**
```python
# JavaScript
for (let i = 0; i < 5; i++) {
    console.log(i);
}

# Python
for i in range(5):
    print(i)
```

---

## 🔥 enumerate() - インデックス付きループ

**JavaScript:**
```javascript
const fruits = ["apple", "banana", "cherry"];
fruits.forEach((fruit, index) => {
    console.log(`${index}: ${fruit}`);
});
```

**Python:**
```python
fruits = ["apple", "banana", "cherry"]

# 🔥 enumerate を使う（Pythonらしい!）
for index, fruit in enumerate(fruits):
    print(f"{index}: {fruit}")

# 開始インデックスを指定
for index, fruit in enumerate(fruits, start=1):
    print(f"{index}: {fruit}")
# 1: apple
# 2: banana
# 3: cherry
```

**🌟 このプロジェクトでの実例:**
```python
# python/src/search/linear_search.py から
for i, value in enumerate(data):  # 🔥 インデックスと値を同時に取得
    if value == target:
        return i
```

---

## 🔥 zip() - 複数のイテラブルを並行処理

```python
names = ["Alice", "Bob", "Charlie"]
ages = [25, 30, 35]

# 🔥 2つのリストを同時にループ
for name, age in zip(names, ages):
    print(f"{name} is {age} years old")
# Alice is 25 years old
# Bob is 30 years old
# Charlie is 35 years old

# 辞書を作成
user_dict = dict(zip(names, ages))
# {"Alice": 25, "Bob": 30, "Charlie": 35}
```

---

## 📊 データ型の選択ガイド

| 必要な機能 | 使うデータ型 |
|-----------|------------|
| 順序あり、変更可能 | **リスト** `[]` |
| 順序あり、変更不可 | **タプル** `()` |
| キーと値のペア | **辞書** `{}` |
| 重複なし、集合演算 | **セット** `set()` |

---

## 🎯 Pythonらしいショートハンドまとめ

### 1. **内包表記**
```python
# リスト
[x ** 2 for x in range(10) if x % 2 == 0]

# 辞書
{x: x ** 2 for x in range(5)}

# セット
{x ** 2 for x in range(5)}
```

### 2. **タプルアンパック**
```python
a, b = b, a  # 変数交換
first, *rest = my_list  # 拡張アンパック
```

### 3. **スライス**
```python
my_list[::-1]  # 逆順
my_list[::2]   # 2つおき
```

### 4. **enumerate と zip**
```python
for i, item in enumerate(items):
    pass

for a, b in zip(list1, list2):
    pass
```

---

## 次のステップ

次は [制御構文](02_control_flow.md) を読んで、ループや条件分岐のPythonらしい書き方を学びましょう！
