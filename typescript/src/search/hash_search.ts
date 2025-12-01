/**
 * 連鎖法（Chaining）を用いたハッシュテーブルの実装
 * 
 * ハッシュテーブルは、キーと値のペアを格納するデータ構造で、
 * 平均的な場合O(1)の時間計算量でデータの挿入、検索、削除が可能です。
 * 
 * 連鎖法とは、ハッシュの衝突（異なるキーが同じハッシュ値を持つこと）を
 * 解決するための手法の一つです。同じハッシュ値を持つ要素は、
 * リンクリストや配列で連結して格納します。
 * 
 * ハッシュテーブルの構造:
 * - テーブル（配列）: 固定サイズの配列
 * - バケット（bucket）: テーブルの各スロットに格納されるリスト
 * - ハッシュ関数: キーをテーブルのインデックスに変換する関数
 * 
 * 時間計算量:
 * - 平均: O(1) - ハッシュの衝突が少ない場合
 * - 最悪: O(n) - 全てのキーが同じバケットに格納された場合
 * 
 * @template K キーの型
 * @template V 値の型
 */
export class HashTable<K, V> {
    /** テーブルのサイズ（バケットの数） */
    private size: number;

    /** ハッシュテーブルの本体（バケットの配列） */
    private table: Array<Array<{ key: K, value: V }>>;

    /**
     * ハッシュテーブルを指定されたサイズで初期化します。
     * 
     * @param size テーブルのサイズ（バケットの数）、デフォルトは10
     */
    constructor(size: number = 10) {
        // テーブルのサイズを保存
        this.size = size;

        // テーブルを初期化
        // 各バケットは空の配列として初期化される
        // fill(null).map(() => []) で各要素に独立した空配列を作成
        // ※ fill([]) だと全要素が同じ配列を参照してしまうため、map を使用
        this.table = new Array(size).fill(null).map(() => []);
    }

    /**
     * キーからハッシュ値（テーブルのインデックス）を計算します。
     * 
     * この実装では、キーの各文字のASCIIコードを合計し、
     * テーブルサイズで割った余りをハッシュ値とします。
     * 
     * @param key ハッシュ化するキー
     * @returns 0からsize-1の範囲のハッシュ値
     */
    private _hash(key: K): number {
        let hash = 0;
        // キーを文字列に変換（数値やオブジェクトも扱えるようにするため）
        const strKey = String(key);

        // 各文字のASCIIコードを合計
        for (let i = 0; i < strKey.length; i++) {
            // charCodeAt(i) で i番目の文字のASCIIコードを取得
            // ハッシュ値がテーブルサイズを超えないよう、毎回余りを取る
            hash = (hash + strKey.charCodeAt(i)) % this.size;
        }
        return hash;
    }

    /**
     * キーと値のペアをハッシュテーブルに挿入します。
     * 同じキーが既に存在する場合は、値を更新します。
     * 
     * @param key 挿入するキー
     * @param value 挿入する値
     */
    insert(key: K, value: V): void {
        // キーのハッシュ値を計算し、対応するバケットを取得
        const index = this._hash(key);
        const bucket = this.table[index];

        // バケット内で同じキーを持つ要素を探す
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                // 既存のキーが見つかった場合、値を更新して終了
                bucket[i].value = value;
                return;
            }
        }

        // 同じキーが存在しない場合、新しい要素をバケットの末尾に追加
        bucket.push({ key, value });
    }

    /**
     * 指定されたキーに対応する値を検索します。
     * 
     * @param key 検索するキー
     * @returns 見つかった場合は値、見つからない場合は null
     */
    search(key: K): V | null {
        // キーのハッシュ値を計算し、対応するバケットを取得
        const index = this._hash(key);
        const bucket = this.table[index];

        // バケット内で同じキーを持つ要素を探す
        for (const item of bucket) {
            if (item.key === key) {
                // キーが見つかった場合、対応する値を返す
                return item.value;
            }
        }

        // キーが見つからなかった場合は null を返す
        return null;
    }

    /**
     * 指定されたキーに対応する要素を削除します。
     * 
     * @param key 削除するキー
     * @returns 削除に成功した場合は true、キーが存在しない場合は false
     */
    delete(key: K): boolean {
        // キーのハッシュ値を計算し、対応するバケットを取得
        const index = this._hash(key);
        const bucket = this.table[index];

        // バケット内で同じキーを持つ要素を探す
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                // キーが見つかった場合、その要素を配列から削除
                // splice(i, 1) で i番目から1要素を削除
                bucket.splice(i, 1);
                return true;
            }
        }

        // キーが見つからなかった場合は false を返す
        return false;
    }
}
