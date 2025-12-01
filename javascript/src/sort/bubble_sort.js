/**
 * バブルソートを用いて配列を昇順にソートします。
 * （配列自体を変更します）
 * 
 * @param {Array} array ソート対象の配列
 * @returns {Array} ソートされた配列
 */
function bubbleSort(array) {
    const n = array.length;
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n - i - 1; j++) {
            if (array[j] > array[j + 1]) {
                [array[j], array[j + 1]] = [array[j + 1], array[j]];
            }
        }
    }
    return array;
}

module.exports = { bubbleSort };
