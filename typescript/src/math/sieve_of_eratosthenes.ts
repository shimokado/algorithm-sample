/**
 * エラトステネスのふるいを用いて、n以下の素数のリストを返します。
 * 
 * @param n 上限値
 * @returns n以下の素数のリスト
 */
export function sieveOfEratosthenes(n: number): number[] {
    if (n < 2) {
        return [];
    }

    const isPrime: boolean[] = new Array(n + 1).fill(true);
    isPrime[0] = false;
    isPrime[1] = false;

    for (let p = 2; p * p <= n; p++) {
        if (isPrime[p]) {
            for (let i = p * p; i <= n; i += p) {
                isPrime[i] = false;
            }
        }
    }

    const primes: number[] = [];
    for (let i = 2; i <= n; i++) {
        if (isPrime[i]) {
            primes.push(i);
        }
    }

    return primes;
}
