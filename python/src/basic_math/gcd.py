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
