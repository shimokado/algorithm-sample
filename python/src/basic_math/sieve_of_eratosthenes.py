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
