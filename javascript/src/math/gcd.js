/**
 * ユークリッドの互除法を用いて最大公約数を計算します。
 * 
 * @param {number} a 整数
 * @param {number} b 整数
 * @returns {number} 最大公約数
 */
function gcd(a, b) {
    a = Math.abs(a);
    b = Math.abs(b);
    while (b) {
        [a, b] = [b, a % b];
    }
    return a;
}

module.exports = { gcd };
