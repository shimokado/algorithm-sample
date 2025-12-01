/**
 * 挿入ソートを用いて配列を昇順にソートします。
 * （配列自体を変更します）
 * 
 * @param {Array} array ソート対象の配列
 * @returns {Array} ソートされた配列
 */
function insertionSort(array) {
    const n = array.length;
    for (let i = 1; i < n; i++) {
        let key = array[i];
        let j = i - 1;
        while (j >= 0 && array[j] > key) {
            array[j + 1] = array[j];
            j--;
        }
        array[j + 1] = key;
    }
    return array;
}

module.exports = { insertionSort };
