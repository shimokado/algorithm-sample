/**
 * マージソートを用いて配列を昇順にソートします。
 * （新しい配列を返します - 非破壊的メソッド）
 * 
 * マージソートは「分割統治法」を用いた安定なソートアルゴリズムです。
 * 配列を再帰的に半分に分割し、ソート済みの部分配列を
 * マージ（統合）することでソートを行います。
 * 
 * アルゴリズムの手順:
 * 1. 配列を半分に分割
 * 2. 各半分を再帰的にソート
 * 3. ソート済みの2つの配列をマージ
 * 
 * 時間計算量: O(n log n) - 常に同じ
 * 空間計算量: O(n) - マージ用の一時配列が必要
 * 安定性: 安定（同じ値の要素の相対的な順序が保持される）
 * 
 * @param {Array} array ソート対象の配列
 * @returns {Array} ソートされた新しい配列（元の配列は変更されない）
 */
function mergeSort(array) {
    // 基底ケース: 要素が1つ以下の配列は既にソート済み
    if (array.length <= 1) {
        return array;
    }

    // 配列の中央のインデックスを計算
    const mid = Math.floor(array.length / 2);

    // 配列を左半分と右半分に分割し、それぞれを再帰的にソート
    // slice(0, mid) で先頭からmid-1までを取得（左半分）
    const left = mergeSort(array.slice(0, mid));
    // slice(mid) でmidから末尾までを取得（右半分）
    const right = mergeSort(array.slice(mid));

    // ソート済みの左右の配列をマージして返す
    return _merge(left, right);
}

/**
 * 2つのソート済み配列をマージして、1つのソート済み配列を返す
 * 
 * @param {Array} left 左側のソート済み配列
 * @param {Array} right 右側のソート済み配列
 * @returns {Array} マージされたソート済み配列
 * @private
 */
function _merge(left, right) {
    // マージ結果を格納する配列
    let result = [];

    // 各配列の現在位置を追跡するインデックス
    let i = 0;  // left配列のインデックス
    let j = 0;  // right配列のインデックス

    // 両方の配列に要素が残っている間、小さい方を選んで追加
    while (i < left.length && j < right.length) {
        // 左の要素が右の要素以下の場合
        if (left[i] <= right[j]) {
            // 左の要素を結果に追加
            result.push(left[i]);
            i++;
        } else {
            // 右の要素を結果に追加
            result.push(right[j]);
            j++;
        }
    }

    // 残りの要素を結果に追加
    // left か right のどちらかに残りがある可能性がある
    // concat で残りの要素を一括追加
    return result.concat(left.slice(i)).concat(right.slice(j));
}

module.exports = { mergeSort };
