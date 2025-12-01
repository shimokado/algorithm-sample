/**
 * ユークリッドの互除法を用いて最大公約数を計算します。
 * 
 * @param a 整数
 * @param b 整数
 * @returns 最大公約数
 */
export function gcd(a: number, b: number): number {
    a = Math.abs(a);
    b = Math.abs(b);
    while (b) {
        [a, b] = [b, a % b];
    }
    return a;
}
