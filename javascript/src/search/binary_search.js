/**
 * 2分探索を用いてソート済みの配列からターゲットを探します。
 * 
 * @param {number[]} array ソート済みの探索対象配列
 * @param {number} target 探索する値
 * @returns {number} 見つかった場合はそのインデックス、見つからない場合は -1
 */
function binarySearch(array, target) {
    let left = 0;
    let right = array.length - 1;

    while (left <= right) {
        const mid = Math.floor((left + right) / 2);
        if (array[mid] === target) {
            return mid;
        } else if (array[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1;
}

module.exports = { binarySearch };
