/**
 * 連鎖法（Chaining）を用いたハッシュテーブルの実装
 */
export class HashTable<K, V> {
    private size: number;
    private table: Array<Array<{ key: K, value: V }>>;

    constructor(size: number = 10) {
        this.size = size;
        this.table = new Array(size).fill(null).map(() => []);
    }

    private _hash(key: K): number {
        let hash = 0;
        const strKey = String(key);
        for (let i = 0; i < strKey.length; i++) {
            hash = (hash + strKey.charCodeAt(i)) % this.size;
        }
        return hash;
    }

    insert(key: K, value: V): void {
        const index = this._hash(key);
        const bucket = this.table[index];

        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket[i].value = value;
                return;
            }
        }

        bucket.push({ key, value });
    }

    search(key: K): V | null {
        const index = this._hash(key);
        const bucket = this.table[index];

        for (const item of bucket) {
            if (item.key === key) {
                return item.value;
            }
        }

        return null;
    }

    delete(key: K): boolean {
        const index = this._hash(key);
        const bucket = this.table[index];

        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                return true;
            }
        }

        return false;
    }
}
