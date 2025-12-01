/**
 * マージソートを用いて配列を昇順にソートします。
 * （新しい配列を返します）
 * 
 * @param array ソート対象の配列
 * @returns ソートされた新しい配列
 */
export function mergeSort<T>(array: T[]): T[] {
    if (array.length <= 1) {
        return array;
    }

    const mid = Math.floor(array.length / 2);
    const left = mergeSort(array.slice(0, mid));
    const right = mergeSort(array.slice(mid));

    return _merge(left, right);
}

function _merge<T>(left: T[], right: T[]): T[] {
    let result: T[] = [];
    let i = 0;
    let j = 0;

    while (i < left.length && j < right.length) {
        if (left[i] <= right[j]) {
            result.push(left[i]);
            i++;
        } else {
            result.push(right[j]);
            j++;
        }
    }

    return result.concat(left.slice(i)).concat(right.slice(j));
}
