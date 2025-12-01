# Algorithm Sample

定番のアルゴリズムを複数のプログラミング言語で実装したサンプルコード集です。
プログラミング言語の学習や、アルゴリズムの理解、各言語の実装比較に役立ててください。

## 目的
- 定番アルゴリズムの仕組みと実装例を示す
- 各言語の標準的なプロジェクト構成やテスト手法を学ぶ
- 言語ごとの実装の違いを比較する

## ディレクトリ構成

プロジェクトのルートディレクトリ直下に、各言語ごとのプロジェクトフォルダとドキュメントフォルダを配置しています。

```text
/
├── docs/                     # アルゴリズムの解説ドキュメント
├── python/                   # Python 実装
│   ├── src/                  # ソースコード (カテゴリ別に分類)
│   └── tests/                # テストコード (pytest)
├── javascript/               # JavaScript 実装
│   ├── src/                  # ソースコード
│   └── test/                 # テストコード (Jest)
├── typescript/               # TypeScript 実装
│   ├── src/                  # ソースコード
│   └── test/                 # テストコード (Jest)
└── powershell/               # PowerShell 実装
    ├── [category]/           # ソースコード (math, search, sort, graph 等)
    └── tests/                # テストコード (Pester)
```

## 対応言語
- [Python](python/README.md)
- [JavaScript](javascript/README.md)
- [TypeScript](typescript/README.md)
- [PowerShell](powershell/README.md)

## ドキュメント
- [アルゴリズム概論](docs/algorithms.md)
- [最大公約数 (GCD)](docs/gcd.md)
- [線形探索 (Linear Search)](docs/linear_search.md)
- [2分探索 (Binary Search)](docs/binary_search.md)
- [バブルソート (Bubble Sort)](docs/bubble_sort.md)
- [選択ソート (Selection Sort)](docs/selection_sort.md)
- [挿入ソート (Insertion Sort)](docs/insertion_sort.md)
- [クイックソート (Quick Sort)](docs/quick_sort.md)
- [マージソート (Merge Sort)](docs/merge_sort.md)
- [ヒープソート (Heap Sort)](docs/heap_sort.md)
- [エラトステネスのふるい (Sieve of Eratosthenes)](docs/sieve_of_eratosthenes.md)
- [ハッシュ探索法 (Hash Search)](docs/hash_search.md)
- [深さ優先探索 (DFS)](docs/dfs.md)
- [幅優先探索 (BFS)](docs/bfs.md)

## ライセンス
MIT
