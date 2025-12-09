/**
 * クイックソートを用いて配列を昇順にソートします。
 * （配列自体を変更します - 破壊的メソッド）
 * 
 * クイックソートは「分割統治法」を用いた高速なソートアルゴリズムです。
 * ピボット（基準値）を選択し、配列をピボットより小さい要素と
 * 大きい要素に分割することを再帰的に繰り返します。
 * 
 * アルゴリズムの手順:
 * 1. ピボットを選択（この実装では配列の最後の要素）
 * 2. ピボットより小さい要素を左側、大きい要素を右側に分割
 * 3. ピボットの左側と右側の部分配列に対して再帰的にソート
 * 
 * 時間計算量:
 * - 平均: O(n log n)
 * - 最悪: O(n²) - ピボットの選択が悪い場合（既にソート済みなど）
 * 空間計算量: O(log n) - 再帰呼び出しのスタック
 * 安定性: 不安定（同じ値の要素の相対的な順序が保持されない場合がある）
 * 
 * @param array ソート対象の配列
 * @returns ソートされた配列（元の配列と同じ参照）
 */
export function quickSort<T>(array: T[]): T[] {
    // 再帰的なクイックソートを実行
    // 初期の範囲は配列全体（インデックス0からlength-1まで）
    _quickSortRecursive(array, 0, array.length - 1);
    return array;
}

/**
 * クイックソートの再帰的な実装部分
 * 
 * @param array ソート対象の配列
 * @param low ソート範囲の開始インデックス
 * @param high ソート範囲の終了インデックス
 */
function _quickSortRecursive<T>(array: T[], low: number, high: number): void {
    // ソート範囲に要素が2つ以上ある場合のみ処理
    // low >= high の場合、要素が0または1つなので処理不要
    if (low < high) {
        // 配列を分割し、ピボットの最終位置を取得
        const pi = _partition(array, low, high);

        // ピボットの左側（ピボットより小さい要素）を再帰的にソート
        _quickSortRecursive(array, low, pi - 1);

        // ピボットの右側（ピボットより大きい要素）を再帰的にソート
        _quickSortRecursive(array, pi + 1, high);
    }
}

/**
 * 配列を分割し、ピボットの最終位置を返す
 * 
 * Lomutoのパーティションスキームを使用:
 * - ピボットより小さい要素を左側に集める
 * - ピボットより大きい要素を右側に集める
 * 
 * @param array 分割対象の配列
 * @param low 分割範囲の開始インデックス
 * @param high 分割範囲の終了インデックス
 * @returns ピボットの最終位置
 */
function _partition<T>(array: T[], low: number, high: number): number {
    // ピボットとして配列の最後の要素を選択
    const pivot = array[high];

    // i はピボットより小さい要素の「境界」を追跡
    // i+1 の位置に次の「小さい要素」が入る
    let i = low - 1;

    // low から high-1 までの各要素を確認
    for (let j = low; j < high; j++) {
        // 現在の要素がピボット以下の場合
        if (array[j] <= pivot) {
            // 境界を1つ右に移動
            i++;
            // 境界位置と現在の要素を交換
            // これにより、小さい要素が左側に集まる
            [array[i], array[j]] = [array[j], array[i]];
        }
    }

    // ピボットを正しい位置（境界の次）に配置
    [array[i + 1], array[high]] = [array[high], array[i + 1]];

    // ピボットの最終位置を返す
    return i + 1;
}
