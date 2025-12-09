# basic_math_gcd.md - GCD (Greatest Common Divisor) Implementation

## Python Feature Introduction

最大公約数（GCD）の計算は、数学の基本的なアルゴリズムです。このPython実装では、ユークリッドの互除法を使用しています。Pythonの特徴として、タプルアンパッキングや型ヒントを活用しています。

## Syntax Explanation

- **関数定義**: `def function_name(parameters) -> return_type:`
- **型ヒント**: 引数と戻り値の型を明示的に指定
- **whileループ**: 条件が真の間繰り返す
- **タプルアンパッキング**: 複数の変数に同時に代入

## JavaScript Comparison

JavaScriptでの同様の実装：
```javascript
function gcd(a, b) {
    while (b !== 0) {
        let temp = b;
        b = a % b;
        a = temp;
    }
    return Math.abs(a);
}
```

Pythonの方が簡潔に書けます。

## Common Pitfalls for JS Developers

1. **条件の書き方**: `while b:` は `while b !== 0:` と同じですが、Pythonでは数値の0や空のコンテナはFalseと評価されます。
2. **タプルアンパッキング**: `a, b = b, a % b` は一時変数を使わずに交換できます。
3. **型ヒント**: オプションですが、コードの理解を助けます。

## Code Walkthrough

```python
def gcd(a: int, b: int) -> int:
    """
    ユークリッドの互除法を用いて最大公約数を計算します。
    
    Args:
        a (int): 整数
        b (int): 整数
        
    Returns:
        int: 最大公約数
    """
    while b:
        a, b = b, a % b
    return abs(a)
```

**Line-by-line explanation:**
- `def gcd(a: int, b: int) -> int:`: 関数定義。aとbはint型、戻り値もint型。
- `"""..."""`: ドックストリング。関数の説明。
- `while b:`: bが0でない間ループ。Pythonでは0はFalse。
- `a, b = b, a % b`: タプルアンパッキングでaとbを交換。a%bを新しいbに。
- `return abs(a)`: aの絶対値を返す。負の数の場合も正しく扱う。

## Type Hints Explanation

- `a: int, b: int`: 引数が整数であることを示す
- `-> int`: 戻り値が整数であることを示す
- 型ヒントは実行時には無視されますが、IDEでの補完やエラーチェックに役立ちます。

## Python-Specific Features

1. **タプルアンパッキング**: 一時変数なしで変数の交換が可能
2. **ドックストリング**: 関数の説明を関数内に記述
3. **abs()関数**: 絶対値を返す組み込み関数

## Key Differences from JavaScript

1. **型ヒント**: JavaScriptにはない静的型付けのヒント
2. **タプルアンパッキング**: Python独特の構文
3. **while条件**: より簡潔な書き方
4. **abs関数**: Math.abs() ではなく abs()

この実装は効率的で、Pythonの特徴を活かしたクリーンなコードです。