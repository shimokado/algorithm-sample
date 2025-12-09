# 02_control_flow.md - Python Control Flow for JavaScript Developers

## Python Feature Introduction

Pythonの制御フロー（条件分岐、ループ、リスト内包表記）は、JavaScriptと似ていますが、いくつかの重要な違いがあります。Pythonはインデントベースの構文を使用し、より読みやすいコードを書くことができます。

## Syntax Explanation

### 条件分岐 (if-elif-else)
```python
if condition:
    # 条件が真の場合の処理
    statement
elif another_condition:
    # 別の条件が真の場合の処理
    statement
else:
    # すべての条件が偽の場合の処理
    statement
```

### forループ
```python
for item in iterable:
    # 各要素に対する処理
    statement
```

### whileループ
```python
while condition:
    # 条件が真の間繰り返す
    statement
```

### リスト内包表記 (List Comprehension)
```python
new_list = [expression for item in iterable if condition]
```

## JavaScript Comparison

JavaScriptでは：
```javascript
if (condition) {
    statement;
} else if (another_condition) {
    statement;
} else {
    statement;
}

for (let item of iterable) {
    statement;
}

while (condition) {
    statement;
}

// 配列メソッドを使用
const newArray = array.filter(item => condition).map(item => expression);
```

## Common Pitfalls for JS Developers

1. **インデントの重要性**: Pythonではインデントが構文の一部です。JavaScriptのように中括弧{}を使わないので、インデントを正しく保つことが必須です。

2. **コロン(:)の使用**: if, for, while, defなどの後にコロンを付けることを忘れやすいです。

3. **range()関数**: JavaScriptのforループとは異なり、Pythonのforループはイテラブルを直接扱います。数値範囲を扱う場合はrange()を使います。

4. **条件式の評価**: Pythonではand/or/notを使いますが、JavaScriptの&&/||/!とは異なり、短絡評価の動作が同じです。

## Code Walkthrough

### 条件分岐の例
```python
def check_number(n: int) -> str:
    if n > 0:
        return "positive"
    elif n < 0:
        return "negative"
    else:
        return "zero"
```

**Line-by-line explanation:**
- `def check_number(n: int) -> str:`: 関数定義。型ヒント付き。
- `if n > 0:`: 条件分岐。コロン必須。
- `return "positive"`: インデントされたブロック内の処理。
- `elif n < 0:`: else ifに相当。Pythonではelif。
- `else:`: それ以外の条件。

### forループの例
```python
def sum_list(numbers: list[int]) -> int:
    total = 0
    for num in numbers:
        total += num
    return total
```

**Line-by-line explanation:**
- `for num in numbers:`: numbersの各要素をnumに代入しながらループ。
- `total += num`: JavaScriptのtotal += numと同じ。

### リスト内包表記の例
```python
def get_even_squares(numbers: list[int]) -> list[int]:
    return [n**2 for n in numbers if n % 2 == 0]
```

**Line-by-line explanation:**
- `[n**2 for n in numbers if n % 2 == 0]`: 
  - `n**2`: 各要素の二乗
  - `for n in numbers`: numbersからnを取り出す
  - `if n % 2 == 0`: 偶数のみ

## Type Hints Explanation

Pythonの型ヒントはオプションですが、コードの読みやすさを向上させます：
- `def function(param: Type) -> ReturnType:`
- リストの場合は`list[int]`のように指定。

## Python-Specific Features

1. **for-else構文**: ループがbreakされずに終了した場合にelseブロックを実行。
2. **while-else構文**: 同様にwhileループ用。
3. **リスト内包表記**: 簡潔なリスト生成。
4. **ジェネレータ式**: メモリ効率の良いイテレーション。

## Key Differences from JavaScript

1. **インデント vs 中括弧**: Pythonはインデントでブロックを定義。
2. **コロンの使用**: 制御構造の後にコロンが必要。
3. **forループ**: 直接イテラブルを扱う（range()で数値範囲）。
4. **真偽値**: True/False (JavaScriptのtrue/false)。
5. **None**: JavaScriptのnull/undefinedに相当。

これらの違いを理解することで、Pythonの制御フローを効果的に使用できます。