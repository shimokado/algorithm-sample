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

## セットアップ

各言語の実装を試すには、対応するフォルダに移動して環境を構築してください。

### Python

pythonフォルダで仮想環境を構築して利用します。

```bash
cd python

# 仮想環境の作成
python -m venv .venv

# 仮想環境の有効化
# Windows (PowerShell)
.venv\Scripts\Activate.ps1
# Windows (Command Prompt)
.venv\Scripts\activate.bat
# macOS/Linux
source .venv/bin/activate

# 依存パッケージのインストール
pip install -r requirements.txt

# テスト実行
pytest

# 仮想環境の無効化
deactivate
```

**注意**: Python 3.8以上を推奨します。仮想環境を使用することで、システムのPython環境を汚染せずに開発できます。

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
