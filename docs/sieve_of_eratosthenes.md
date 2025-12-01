# エラトステネスのふるい (Sieve of Eratosthenes)

指定された整数 $n$ 以下の全ての素数を効率的に発見するためのアルゴリズムです。

## アルゴリズムの概要
1. $2$ から $n$ までの整数を並べる。
2. 生き残っている数の中で最小の数（最初は $2$）を素数として記録する。
3. その素数の倍数を全て消去する（ふるい落とす）。
4. 次に生き残っている最小の数を素数とし、その倍数を消去する。
5. 上記を、探索する数が $\sqrt{n}$ になるまで繰り返す。
6. 最後まで残った数が全て素数である。

## 計算量
- **時間計算量**: $O(n \log \log n)$
- **空間計算量**: $O(n)$

## 擬似コード
```
function sieve(n):
    is_prime = [true] * (n + 1)
    is_prime[0] = false
    is_prime[1] = false
    
    for p from 2 to sqrt(n):
        if is_prime[p]:
            for i from p * p to n step p:
                is_prime[i] = false
                
    primes = []
    for i from 2 to n:
        if is_prime[i]:
            append i to primes
            
    return primes
```
