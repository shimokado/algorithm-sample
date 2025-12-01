/**
 * ヒープソートを用いて配列を昇順にソートします。
 * （配列自体を変更します）
 * 
 * @param array ソート対象の配列
 * @returns ソートされた配列
 */
export function heapSort<T>(array: T[]): T[] {
    const n = array.length;

    // Build heap (rearrange array)
    for (let i = Math.floor(n / 2) - 1; i >= 0; i--) {
        _heapify(array, n, i);
    }

    // One by one extract an element from heap
    for (let i = n - 1; i > 0; i--) {
        // Move current root to end
        [array[0], array[i]] = [array[i], array[0]];

        // call max heapify on the reduced heap
        _heapify(array, i, 0);
    }

    return array;
}

function _heapify<T>(array: T[], n: number, i: number): void {
    let largest = i;
    const l = 2 * i + 1;
    const r = 2 * i + 2;

    if (l < n && array[l] > array[largest]) {
        largest = l;
    }

    if (r < n && array[r] > array[largest]) {
        largest = r;
    }

    if (largest !== i) {
        [array[i], array[largest]] = [array[largest], array[i]];
        _heapify(array, n, largest);
    }
}
