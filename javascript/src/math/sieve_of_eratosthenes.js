/**
 * エラトステネスのふるいを用いて、n以下の素数のリストを返します。
 * 
 * エラトステネスのふるいは、古代ギリシャの数学者エラトステネスが考案した
 * 素数を見つけるための効率的なアルゴリズムです。
 * 
 * アルゴリズムの手順:
 * 1. 2からnまでの全ての数を「素数候補」としてマークする
 * 2. 最小の素数候補（最初は2）を選ぶ
 * 3. その数の倍数を全て「素数ではない」としてマークする
 * 4. 次の素数候補を選び、手順3を繰り返す
 * 5. p * p > n になったら終了
 * 
 * 時間計算量: O(n log log n)
 * 空間計算量: O(n)
 * 
 * @param {number} n 上限値（この値以下の素数を全て求める）
 * @returns {number[]} n以下の素数を昇順に並べた配列
 */
function sieveOfEratosthenes(n) {
    // 2より小さい場合、素数は存在しない
    // 素数の定義: 1より大きく、1とその数自身以外に約数を持たない自然数
    if (n < 2) {
        return [];
    }

    // isPrime[i] = true の場合、iは素数の候補
    // 初期状態では全ての数を素数候補（true）とする
    const isPrime = new Array(n + 1).fill(true);

    // 0と1は素数ではないので、falseに設定
    isPrime[0] = false;
    isPrime[1] = false;

    // pの倍数をふるい落とす処理
    // p * p > n になったら終了（それ以降の倍数は既にふるい落とされている）
    for (let p = 2; p * p <= n; p++) {
        // pが素数候補の場合のみ処理を行う
        if (isPrime[p]) {
            // pの倍数を全て素数ではないとマーク
            // p * p から始める理由: p * 2, p * 3, ... , p * (p-1) は
            // より小さい素数の倍数として既にふるい落とされているため
            for (let i = p * p; i <= n; i += p) {
                isPrime[i] = false;
            }
        }
    }

    // 素数のリストを作成
    // isPrime配列でtrueになっている全てのインデックスが素数
    const primes = [];
    for (let i = 2; i <= n; i++) {
        if (isPrime[i]) {
            primes.push(i);
        }
    }

    return primes;
}

module.exports = { sieveOfEratosthenes };
