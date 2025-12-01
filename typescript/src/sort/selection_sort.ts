/**
 * 選択ソートを用いて配列を昇順にソートします。
 * （配列自体を変更します）
 * 
 * @param array ソート対象の配列
 * @returns ソートされた配列
 */
export function selectionSort<T>(array: T[]): T[] {
    const n = array.length;
    for (let i = 0; i < n; i++) {
        let minIndex = i;
        for (let j = i + 1; j < n; j++) {
            if (array[j] < array[minIndex]) {
                minIndex = j;
            }
        }
        if (minIndex !== i) {
            [array[i], array[minIndex]] = [array[minIndex], array[i]];
        }
    }
    return array;
}
