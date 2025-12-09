# 03_python_shorthands.md - Python Shortcuts and Idioms

## Python Feature Introduction

Pythonには、コードを簡潔に書くための様々なショートハンド（省略記法）があります。このドキュメントでは、`python\src`で実際に使用されているショートハンドを中心に、Pythonらしい書き方を解説します。JavaScript開発者がPythonのコードを読んで理解しやすくするために、JSとの比較も交えています。

## Syntax Explanation

Pythonのショートハンドは、読みやすさと簡潔さを両立するように設計されています。以下に主なものを紹介します。

## JavaScript Comparison

JavaScriptでは、これらの機能の一部はES6以降で利用可能ですが、Pythonの方がより自然で強力です。

## Code Walkthrough

### 1. タプルアンパッキング (Tuple Unpacking)
**使用例**: `a, b = b, a % b` (GCD実装で使用)

```python
# 変数の交換
x, y = y, x

# 複数の戻り値を受け取る
def get_coords():
    return 10, 20

x, y = get_coords()
```

**JavaScript比較**:
```javascript
// JavaScriptでは分割代入
[x, y] = [y, x];
const [x, y] = getCoords();
```

**解説**: Pythonではタプルアンパッキングが非常に自然。JavaScriptの分割代入に相当しますが、より簡潔です。

### 2. リスト内包表記 (List Comprehension)
**使用例**: `[True] * (n + 1)` (Sieve実装で使用)

```python
# 基本形
squares = [x**2 for x in range(10)]

# 条件付き
even_squares = [x**2 for x in range(10) if x % 2 == 0]

# ネスト
matrix = [[i*j for j in range(3)] for i in range(3)]
```

**JavaScript比較**:
```javascript
// JavaScriptではmap/filter
const squares = Array.from({length: 10}, (_, i) => i**2);
const evenSquares = Array.from({length: 10}, (_, i) => i)
    .filter(x => x % 2 === 0)
    .map(x => x**2);
```

**解説**: Pythonのリスト内包表記は非常に強力。JavaScriptのmap/filterより簡潔に書けます。

### 3. 辞書内包表記 (Dictionary Comprehension)
**使用例**: `python\src`では直接使用されていないが、代表的なショートハンド

```python
# 基本形
squares_dict = {x: x**2 for x in range(5)}

# 条件付き
even_squares = {x: x**2 for x in range(10) if x % 2 == 0}
```

**JavaScript比較**:
```javascript
// JavaScriptではObject.fromEntries
const squaresDict = Object.fromEntries(
    Array.from({length: 5}, (_, i) => [i, i**2])
);
```

### 4. enumerate()関数
**使用例**: `for i, value in enumerate(data):` (Linear Searchで使用)

```python
data = ['a', 'b', 'c']
for index, value in enumerate(data):
    print(f"Index: {index}, Value: {value}")
# Index: 0, Value: a
# Index: 1, Value: b
# Index: 2, Value: c
```

**JavaScript比較**:
```javascript
// JavaScriptではentries()
const data = ['a', 'b', 'c'];
for (const [index, value] of data.entries()) {
    console.log(`Index: ${index}, Value: ${value}`);
}
```

**解説**: Pythonのenumerate()はインデックスと値を同時に取得するのに便利。

### 5. range()関数
**使用例**: `range(p * p, n + 1, p)` (Sieveで使用)

```python
# 基本形
for i in range(5):  # 0, 1, 2, 3, 4
    print(i)

# 開始指定
for i in range(2, 5):  # 2, 3, 4
    print(i)

# ステップ指定
for i in range(0, 10, 2):  # 0, 2, 4, 6, 8
    print(i)
```

**JavaScript比較**:
```javascript
// JavaScriptではforループ
for (let i = 0; i < 5; i++) {
    console.log(i);
}
```

**解説**: Pythonのrange()はメモリ効率が良く、数値シーケンスを生成します。

### 6. スライス記法 (Slicing)
**使用例**: `data[:mid], data[mid:]` (Merge Sortで使用)

```python
data = [1, 2, 3, 4, 5]

# 最初の3要素
first_three = data[:3]  # [1, 2, 3]

# 3番目以降
from_third = data[3:]  # [4, 5]

# 逆順
reversed_data = data[::-1]  # [5, 4, 3, 2, 1]

# ステップ
every_other = data[::2]  # [1, 3, 5]
```

**JavaScript比較**:
```javascript
// JavaScriptではslice()
const data = [1, 2, 3, 4, 5];
const firstThree = data.slice(0, 3);
const fromThird = data.slice(3);
const reversedData = data.slice().reverse();
```

**解説**: Pythonのスライスは非常に柔軟。JavaScriptのslice()より強力です。

### 7. 条件式 (Conditional Expression)
**使用例**: `python\src`では直接使用されていないが、代表的なショートハンド

```python
# 基本形
result = "even" if x % 2 == 0 else "odd"

# ネスト
result = "positive" if x > 0 else "negative" if x < 0 else "zero"
```

**JavaScript比較**:
```javascript
// JavaScriptでも同じ
const result = x % 2 === 0 ? "even" : "odd";
```

**解説**: PythonとJavaScriptで構文が同じです。

### 8. 複数代入 (Multiple Assignment)
**使用例**: `i = j = 0` (Merge Sortで使用)

```python
# 同じ値を複数の変数に
a = b = c = 0

# 異なる値
x, y, z = 1, 2, 3
```

**JavaScript比較**:
```javascript
// JavaScriptでも可能
let a = b = c = 0;
const [x, y, z] = [1, 2, 3];
```

### 9. extend()メソッド
**使用例**: `result.extend(left[i:])` (Merge Sortで使用)

```python
list1 = [1, 2, 3]
list2 = [4, 5, 6]

list1.extend(list2)  # list1 becomes [1, 2, 3, 4, 5, 6]
# vs
list1 += list2  # same result
```

**JavaScript比較**:
```javascript
// JavaScriptではconcat() or spread
const list1 = [1, 2, 3];
const list2 = [4, 5, 6];
const combined = [...list1, ...list2];
```

**解説**: extend()は元のリストを変更します。

### 10. ラムダ関数 (Lambda Functions)
**使用例**: `python\src`では直接使用されていないが、代表的なショートハンド

```python
# 基本形
square = lambda x: x**2
print(square(5))  # 25

# ソートで使用
data = [(1, 'b'), (2, 'a'), (3, 'c')]
data.sort(key=lambda x: x[1])  # 2番目の要素でソート
```

**JavaScript比較**:
```javascript
// JavaScriptのアロー関数
const square = x => x**2;
console.log(square(5)); // 25

const data = [[1, 'b'], [2, 'a'], [3, 'c']];
data.sort((a, b) => a[1].localeCompare(b[1]));
```

## Common Pitfalls for JS Developers

1. **タプルアンパッキング**: `a, b = b, a` は一時変数不要。JavaScriptの`[a, b] = [b, a]`に相当。
2. **リスト内包表記**: 条件を後ろに書く：`[x for x in list if condition]`
3. **スライス**: `data[::-1]`で逆順。JavaScriptでは`data.slice().reverse()`。
4. **range()**: イテレータなので、リストが必要なら`list(range(5))`。
5. **extend() vs append()**: extend()はイテラブルを追加、append()は単一要素を追加。

## Advanced Shortcuts and Techniques

### 11. アンパック演算子 (Unpacking Operators)
**使用例**: 関数引数やコンテナの展開

```python
# 関数引数のアンパック
def f(a, b, c, d):
    return 1

args = [0, 1, 2, 3]
f(*args)  # f(0, 1, 2, 3)

# 複数のイテラブルをアンパック
f(*[0, 1], *[2, 3])  # f(0, 1, 2, 3)

# セットのアンパック
{*range(4), 4, *(5, 6, 7)}  # {0, 1, 2, 3, 4, 5, 6, 7}

# 辞書のアンパック
{'x': 1, **{'y': 2}}  # {'x': 1, 'y': 2}
```

**JavaScript比較**:
```javascript
// JavaScriptではspread演算子
function f(a, b, c, d) { return 1; }
const args = [0, 1, 2, 3];
f(...args);

const set = new Set([...Array(4).keys(), 4, ...[5, 6, 7]]);
const obj = {...{x: 1}, ...{y: 2}};
```

**解説**: `*`はイテラブルをアンパック、`**`は辞書をアンパック。JavaScriptのspread演算子に相当。

### 12. f-string (Formatted String Literals)
**使用例**: 文字列フォーマット

```python
name = "Fred"
f"He said his name is {name}."  # 'He said his name is Fred.'

# 式も使用可能
f"2 + 2 = {2 + 2}"  # '2 + 2 = 4'

# デバッグ用
user = 'eric_idle'
member_since = "1975-07-31"
f'{user=} {member_since=}'  # "user='eric_idle' member_since='1975-07-31'"
```

**JavaScript比較**:
```javascript
// JavaScriptではテンプレートリテラル
const name = "Fred";
`He said his name is ${name}.`;

// デバッグ用に手動
`user=${user} member_since=${member_since}`;
```

**解説**: f-stringはPython 3.6+で導入。JavaScriptのテンプレートリテラルより強力。

### 13. 数値リテラル (Numeric Literals)
**使用例**: 読みやすい数値表記

```python
# アンダースコアで区切り
1_000_000_000_000_000  # 1000000000000000

# 16進数
0x_FF_FF_FF_FF  # 4294967295
```

**JavaScript比較**:
```javascript
// JavaScriptではアンダースコア非対応
1000000000000000;

// 16進数は同じ
0xFFFFFFFF;
```

**解説**: アンダースコアは読みやすさのために無視される。

### 14. 辞書の順序保証 (Dictionary Order Preservation)
**使用例**: Python 3.7+での辞書の順序

```python
# 挿入順序が保持される
{"c":1, "b":2, "a":3}.keys()  # dict_keys(['c', 'b', 'a'])
{"a":1, "b":2, "c":3}.keys()  # dict_keys(['a', 'b', 'c'])
```

**JavaScript比較**:
```javascript
// JavaScriptのオブジェクトはES2015+で順序保証
// Mapは常に順序保証
const map = new Map([['c', 1], ['b', 2], ['a', 3]]);
```

**解説**: Python 3.7+で辞書の順序が保証されるようになった。

### 15. 代入式 (Walrus Operator)
**使用例**: 式内で代入

```python
# 条件式内での代入
if (n := len(a)) > 10:
    print(f"List is too long ({n} elements, expected <= 10)")

# リスト内包表記内
[clean_name.title() for name in names
 if (clean_name := normalize('NFC', name)) in allowed_names]
```

**JavaScript比較**:
```javascript
// JavaScriptにはない（提案中）
let n = a.length;
if (n > 10) {
    console.log(`List is too long (${n} elements, expected <= 10)`);
}
```

**解説**: `:=` で代入式。Python 3.8+で導入。

### 16. ビット演算ショートカット
**使用例**: 計算の短縮

```python
# long
b * (a - 1) * 5

# short ( ~-a は a-1 に相当)
b * ~-a * 5
```

**JavaScript比較**:
```javascript
// JavaScriptでもビット演算可能だが、読みにくい
b * (a - 1) * 5;  // 同じ
```

**解説**: `~-a` は `-(a+1)` ではなく、`~(-a)` = `-(-a)-1` = `a-1`。正しくは `~-a = a-1`。

### 17. バッククォート (古い機能)
**使用例**: Python 2時代のreprショートカット

```python
# long
str(1600)

# short (Python 2のみ)
`1600`
```

**JavaScript比較**:
```javascript
// JavaScriptにはない
String(1600);
```

**解説**: Python 3では削除された機能。`repr()`のショートカットだった。

### 18. 比較ショートカット
**使用例**: 条件の簡略化

```python
# 最初の文字と最後の文字両方が一致する
# long
a[0] == b[0] and a[-1] == b[-1]

# short
a[0] + a[-1] == b[0] + b[-1]

# a と b, c と d の長さが同じ場合
# long
a == b and c == d

# short
a + c == b + d
```

**JavaScript比較**:
```javascript
// JavaScriptでも同じ論理
a[0] === b[0] && a[a.length-1] === b[b.length-1];
a[0] + a[a.length-1] === b[0] + b[b.length-1];

a === b && c === d;
a + c === b + d;
```

**解説**: 文字列やリストの比較を簡略化。条件によっては有効。

## Python-Specific Features

1. **リスト内包表記のネスト**: `[[i*j for j in range(3)] for i in range(3)]`
2. **スライスの拡張**: `data[start:stop:step]`
3. **アンパック演算子**: `*` と `**` （関数引数で使用）
4. **ジェネレータ式**: `(x**2 for x in range(10))` - メモリ効率良い

## Key Differences from JavaScript

1. **内包表記**: Pythonの方が強力で読みやすい
2. **スライス**: より柔軟な構文
3. **enumerate()**: 専用関数がある
4. **range()**: メモリ効率の良いイテレータ
5. **タプルアンパッキング**: より自然

これらのショートハンドを活用することで、Pythonコードをより簡潔で読みやすく書けます。特にJavaScript開発者は、内包表記とスライス記法に慣れると、Pythonの強力さが実感できるでしょう。