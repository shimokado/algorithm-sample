# Python基礎 - JavaScript開発者向け

JavaScriptを知っているあなたが、Pythonを学ぶ上で最初に知っておくべき基本事項を解説します。

---

## 🎯 最も重要な違い

### 1. **インデントが構文**

**JavaScript:**
```javascript
function greet(name) {
    if (name) {
        console.log("Hello, " + name);
    }
}
```

**Python:**
```python
def greet(name):
    if name:
        print(f"Hello, {name}")
```

> **重要**: Pythonでは波括弧 `{}` の代わりに **インデント（4スペース）** でコードブロックを表現します。インデントが間違っていると `IndentationError` が発生します。

---

### 2. **コロン `:` でブロック開始**

関数、if文、ループなどのブロックを開始するときは、行末に **コロン `:`** が必要です。

```python
def my_function():  # ← コロンが必要
    pass

if condition:  # ← コロンが必要
    do_something()

for item in items:  # ← コロンが必要
    process(item)
```

---

## 📝 変数と型

### 変数宣言

**JavaScript:**
```javascript
const name = "Alice";
let age = 25;
var city = "Tokyo";  // 非推奨
```

**Python:**
```python
name = "Alice"  # let/const不要
age = 25
city = "Tokyo"
```

> **ポイント**: Pythonには `let`, `const`, `var` キーワードはありません。そのまま代入するだけです。

---

### 型ヒント（Type Hints）

Pythonは動的型付け言語ですが、**型ヒント**を付けることができます（実行時には強制されません）。

**JavaScript (TypeScript):**
```typescript
function add(a: number, b: number): number {
    return a + b;
}
```

**Python:**
```python
def add(a: int, b: int) -> int:
    return a + b
```

**型ヒントの書き方:**
```python
# 基本型
def greet(name: str) -> str:
    return f"Hello, {name}"

# リスト型
def process_numbers(numbers: List[int]) -> List[int]:
    return [n * 2 for n in numbers]

# 辞書型
def get_user(user_id: int) -> Dict[str, Any]:
    return {"id": user_id, "name": "Alice"}

# 複数の型を許可
from typing import Union, Optional

def parse_id(value: Union[int, str]) -> int:
    return int(value)

# Noneを許可（Optional[T] は Union[T, None] のショートハンド）
def find_user(user_id: int) -> Optional[str]:
    return None  # ユーザーが見つからない場合
```

---

## 🔤 文字列

### 文字列補間

**JavaScript:**
```javascript
const name = "Alice";
const age = 25;
const message = `My name is ${name} and I'm ${age} years old`;
```

**Python:**
```python
name = "Alice"
age = 25
message = f"My name is {name} and I'm {age} years old"  # f文字列
```

> **ポイント**: Pythonでは文字列の前に `f` を付けて **f文字列（f-string）** を使います。

---

### その他の文字列操作

```python
# 文字列の連結
greeting = "Hello" + " " + "World"

# 文字列の繰り返し
stars = "*" * 10  # "**********"

# 複数行文字列
text = """
これは
複数行の
文字列です
"""

# 文字列メソッド
"hello".upper()  # "HELLO"
"HELLO".lower()  # "hello"
"  trim  ".strip()  # "trim"
"a,b,c".split(",")  # ["a", "b", "c"]
```

---

## 🎭 真偽値と条件

### Falsy な値

**JavaScript と Python の比較:**

| JavaScript | Python |
|-----------|--------|
| `false` | `False` |
| `null` | `None` |
| `undefined` | （存在しない） |
| `0` | `0` |
| `""` | `""` |
| `[]` | `[]` |
| `{}` | `{}` |

> **重要**: Pythonでは `True` と `False` は **大文字始まり** です。

---

### 比較演算子

**JavaScript:**
```javascript
if (a === b) { }   // 厳密等価
if (a !== b) { }   // 厳密不等価
if (a && b) { }    // 論理AND
if (a || b) { }    // 論理OR
if (!a) { }        // 論理NOT
```

**Python:**
```python
if a == b:         # 等価（Pythonには===がない）
    pass
if a != b:         # 不等価
    pass
if a and b:        # 論理AND
    pass
if a or b:         # 論理OR
    pass
if not a:          # 論理NOT
    pass
```

**特別な比較:**
```python
# None のチェック（is を使う）
if value is None:
    pass

if value is not None:
    pass

# メンバーシップテスト
if item in my_list:
    pass

if key not in my_dict:
    pass
```

---

## 🔧 関数

### 基本の関数定義

**JavaScript:**
```javascript
function add(a, b) {
    return a + b;
}

// アロー関数
const add = (a, b) => a + b;
```

**Python:**
```python
def add(a, b):
    return a + b

# Pythonには「アロー関数」はありません
# lambda式はありますが、一行のみです
add = lambda a, b: a + b
```

---

### デフォルト引数

**JavaScript:**
```javascript
function greet(name = "Guest") {
    console.log(`Hello, ${name}`);
}
```

**Python:**
```python
def greet(name="Guest"):
    print(f"Hello, {name}")
```

---

### キーワード引数（Named Parameters）

Pythonでは、引数を名前で指定できます。

```python
def create_user(name, age, city="Tokyo"):
    return {"name": name, "age": age, "city": city}

# 位置引数
user1 = create_user("Alice", 25)

# キーワード引数（順序を変えてもOK）
user2 = create_user(age=30, name="Bob", city="Osaka")

# 混在もOK（位置引数が先）
user3 = create_user("Charlie", age=35, city="Kyoto")
```

---

### 可変長引数

**JavaScript:**
```javascript
function sum(...numbers) {
    return numbers.reduce((a, b) => a + b, 0);
}
```

**Python:**
```python
def sum_numbers(*numbers):
    return sum(numbers)

# 使用例
result = sum_numbers(1, 2, 3, 4, 5)  # 15
```

**キーワード可変長引数:**
```python
def create_user(**kwargs):
    return kwargs

user = create_user(name="Alice", age=25, city="Tokyo")
# {"name": "Alice", "age": 25, "city": "Tokyo"}
```

---

## 🚫 None（JavaScriptのnull/undefined）

**JavaScript:**
```javascript
let value = null;
let value2 = undefined;
```

**Python:**
```python
value = None  # JavaScriptのnull/undefinedに相当
```

**Noneのチェック:**
```python
# 良い例
if value is None:
    pass

# 悪い例（動くが推奨されない）
if value == None:
    pass
```

---

## 📦 モジュールのインポート

### モジュール全体をインポート

**JavaScript:**
```javascript
import math from 'math';
import * as math from 'math';
```

**Python:**
```python
import math

result = math.sqrt(16)  # 4.0
```

---

### 特定の関数だけインポート

**JavaScript:**
```javascript
import { sqrt, pow } from 'math';
```

**Python:**
```python
from math import sqrt, pow

result = sqrt(16)  # 4.0（math.不要）
```

---

### エイリアスを使う

**JavaScript:**
```javascript
import { something as alias } from 'module';
```

**Python:**
```python
import numpy as np
from typing import List as L
```

---

## 🎯 Pythonらしい書き方のヒント

### 1. **Truthyチェックを活用**

```python
# 悪い例
if len(my_list) > 0:
    pass

# 良い例（Pythonらしい）
if my_list:
    pass
```

---

### 2. **`pass` 文**

何もしない空のブロックが必要な場合、`pass` を使います。

```python
def todo_function():
    pass  # 後で実装

if condition:
    pass  # 何もしない
else:
    do_something()
```

---

### 3. **`in` 演算子**

```python
# リストのメンバーシップ
if item in my_list:
    pass

# 辞書のキー存在確認
if "name" in user_dict:
    pass

# 文字列の部分文字列チェック
if "hello" in message:
    pass
```

---

## 🔑 重要なポイントまとめ

| 概念 | JavaScript | Python |
|------|-----------|--------|
| ブロック | `{ }` | インデント |
| 真偽値 | `true/false` | `True/False` |
| null | `null/undefined` | `None` |
| AND/OR/NOT | `&&` `\|\|` `!` | `and` `or` `not` |
| 厳密等価 | `===` | `==` |
| 変数宣言 | `let/const/var` | 不要 |
| 文字列補間 | `` `${var}` `` | `f"{var}"` |
| コメント | `//` `/* */` | `#` `""" """` |

---

## 次のステップ

次は [データ型と操作](01_python_data_types.md) を読んで、リスト、辞書、セットなどのPythonのデータ構造を学びましょう！
