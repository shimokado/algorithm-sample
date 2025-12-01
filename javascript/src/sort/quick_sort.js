/**
 * クイックソートを用いて配列を昇順にソートします。
 * （配列自体を変更します）
 * 
 * @param {Array} array ソート対象の配列
 * @returns {Array} ソートされた配列
 */
function quickSort(array) {
    _quickSortRecursive(array, 0, array.length - 1);
    return array;
}

function _quickSortRecursive(array, low, high) {
    if (low < high) {
        const pi = _partition(array, low, high);
        _quickSortRecursive(array, low, pi - 1);
        _quickSortRecursive(array, pi + 1, high);
    }
}

function _partition(array, low, high) {
    const pivot = array[high];
    let i = low - 1;
    for (let j = low; j < high; j++) {
        if (array[j] <= pivot) {
            i++;
            [array[i], array[j]] = [array[j], array[i]];
        }
    }
    [array[i + 1], array[high]] = [array[high], array[i + 1]];
    return i + 1;
}

module.exports = { quickSort };
