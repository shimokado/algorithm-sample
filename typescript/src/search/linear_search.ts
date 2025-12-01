/**
 * 線形探索を用いて配列からターゲットを探します。
 * 
 * @param array 探索対象の配列
 * @param target 探索する値
 * @returns 見つかった場合はそのインデックス、見つからない場合は -1
 */
export function linearSearch<T>(array: T[], target: T): number {
    for (let i = 0; i < array.length; i++) {
        if (array[i] === target) {
            return i;
        }
    }
    return -1;
}
