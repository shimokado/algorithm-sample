/**
 * エラトステネスのふるいを用いて、n以下の素数のリストを返します。
 * 
 * @param {number} n 上限値
 * @returns {Array} n以下の素数のリスト
 */
function sieveOfEratosthenes(n) {
    if (n < 2) {
        return [];
    }

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

module.exports = { sieveOfEratosthenes };
