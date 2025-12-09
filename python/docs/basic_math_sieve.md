# basic_math_sieve.md - Sieve of Eratosthenes Implementation

## Python Feature Introduction

エラトステネスの篩は、指定された範囲内の素数を効率的に見つけるアルゴリズムです。このPython実装では、ブール値のリストを使って素数をマークしています。Pythonのリスト操作とrange関数を活用しています。

## Syntax Explanation

- **リスト初期化**: `[True] * (n + 1)` で同じ値のリストを作成
- **range関数**: `range(start, stop, step)` で数値シーケンスを生成
- **リストインデックス**: `list[index] = value` で要素を変更
- **型ヒント**: `List[int]` で整数のリストを指定

## JavaScript Comparison

JavaScriptでの同様の実装：
```javascript
function sieveOfEratosthenes(n) {
    if (n < 2) return [];
    
    const isPrime = new Array(n + 1).fill(true);
    isPrime[0] = false;
    isPrime[1] = false;
    
    for (let p = 2; p * p <= n; p++) {
        if (isPrime[p]) {
            for (let i = p * p; i <= n; i += p) {
                isPrime[i] = false;
            }
        }
    }
    
    const primes = [];
    for (let i = 2; i <= n; i++) {
        if (isPrime[i]) {
            primes.push(i);
        }
    }
    return primes;
}
```

Pythonの方が簡潔です。

## Common Pitfalls for JS Developers

1. **リスト初期化**: `[True] * (n + 1)` はArray(n+1).fill(true)と同じですが、Pythonでは*演算子で繰り返し。
2. **range関数**: range(2, n+1) は2からnまでのシーケンスを生成。
3. **インデックスアクセス**: PythonのリストはJavaScriptの配列と同じようにアクセス可能。

## Code Walkthrough

```python
from typing import List

def sieve_of_eratosthenes(n: int) -> List[int]:
    """
    エラトステネスのふるいを用いて、n以下の素数のリストを返します。
    
    Args:
        n (int): 上限値
        
    Returns:
        List[int]: n以下の素数のリスト
    """
    if n < 2:
        return []
        
    is_prime = [True] * (n + 1)
    is_prime[0] = False
    is_prime[1] = False
    
    p = 2
    while (p * p <= n):
        if is_prime[p]:
            for i in range(p * p, n + 1, p):
                is_prime[i] = False
        p += 1
        
    primes = []
    for i in range(2, n + 1):
        if is_prime[i]:
            primes.append(i)
            
    return primes
```

**Line-by-line explanation:**
- `from typing import List`: List型ヒントをインポート。
- `def sieve_of_eratosthenes(n: int) -> List[int]:`: 関数定義。戻り値は整数のリスト。
- `if n < 2: return []`: 2未満の場合は空リスト。
- `is_prime = [True] * (n + 1)`: n+1個のTrueで初期化されたリスト。
- `is_prime[0] = False; is_prime[1] = False`: 0と1は素数ではない。
- `while (p * p <= n):`: pの二乗がn以下である間。
- `for i in range(p * p, n + 1, p):`: p*pからnまでpステップでループ。
- `primes = []`: 空のリストを作成。
- `primes.append(i)`: リストに要素を追加。

## Type Hints Explanation

- `n: int`: 引数が整数
- `-> List[int]`: 戻り値が整数のリスト
- `from typing import List`: typingモジュールからListをインポート

## Python-Specific Features

1. **リストの*演算子**: `[value] * count` で繰り返しリストを作成
2. **range関数**: メモリ効率の良いシーケンス生成
3. **リストメソッド**: append() で要素を追加

## Key Differences from JavaScript

1. **リスト初期化**: fill()メソッドではなく*演算子
2. **range関数**: JavaScriptにはない組み込み関数
3. **型ヒント**: JavaScriptにはない
4. **インポート**: from typing import List のような明示的なインポート

このアルゴリズムは効率的で、Pythonのリスト操作をよく表しています。