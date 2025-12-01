/**
 * バブルソートを用いて配列を昇順にソートします。
 * （配列自体を変更します）
 * 
 * @param array ソート対象の配列
 * @returns ソートされた配列
 */
export function bubbleSort<T>(array: T[]): T[] {
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
