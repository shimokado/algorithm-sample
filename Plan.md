# アルゴリズム実装プロジェクト計画

## プロジェクト概要
定番のアルゴリズムを複数のプログラミング言語（Python, JavaScript, TypeScript, PowerShell）で実装し、言語間の比較や学習に役立つサンプルコード集を構築します。

## 現状ステータス (2025/12/01)
- **対応言語**: Python, JavaScript, TypeScript, PowerShell (環境構築完了)
- **実装済みアルゴリズム**: 最大公約数 (GCD)
- **ドキュメント**: アルゴリズム概論, GCD解説

## 今後の実装ロードマップ

アルゴリズムの難易度とカテゴリごとにフェーズを分けて実装を進めます。

### Phase 1: 基本的な探索とソート
プログラミングの基礎となるアルゴリズム群です。
- [x] **探索**: 線形探索 (Linear Search)
- [x] **探索**: 2分探索 (Binary Search)
- [x] **ソート**: バブルソート (Bubble Sort)
- [x] **ソート**: 選択ソート (Selection Sort)
- [x] **ソート**: 挿入ソート (Insertion Sort)

### Phase 2: 高速なソートと数学
実用的なパフォーマンスを持つソートと、基本的な数学アルゴリズムです。
- [x] **ソート**: クイックソート (Quick Sort)
- [x] **ソート**: マージソート (Merge Sort)
- [x] **ソート**: ヒープソート (Heap Sort)
- [x] **数学**: エラトステネスのふるい (Sieve of Eratosthenes)

### Phase 3: データ構造とグラフ探索
データ構造を利用した探索や、グラフ理論の基礎です。
- [x] **探索**: ハッシュ表探索法 (Hash Search)
- [x] **グラフ**: 深さ優先探索 (DFS)
- [x] **グラフ**: 幅優先探索 (BFS)

### Phase 4: 応用アルゴリズム (実装対象外)
以下のアルゴリズムは、本プロジェクトの初期スコープ外とします。
- [ ] **グラフ**: ダイクストラ法 (Dijkstra's Algorithm)
- [ ] **グラフ**: A*アルゴリズム (A* Search)
- [ ] **その他**: 動的計画法 (Dynamic Programming - Knapsack Problem)
- [ ] **その他**: 貪欲法 (Greedy Algorithm)
- [ ] **その他**: 文字列探索 (String Search - KMP)
- [ ] **その他**: LRUキャッシュ (LRU Cache)

## 作業ワークフロー
各アルゴリズムについて、以下の手順で実装を進めます。

1. **ドキュメント作成**
   - `docs/[algorithm_name].md` を作成し、アルゴリズムの概要、計算量、擬似コードを記述。
   - `docs/algorithms.md` や `README.md` からリンクを追加。

2. **各言語での実装とテスト**
   - **Python**: `python/src/[category]/` に実装, `python/tests/` にテスト追加。
   - **JavaScript**: `javascript/src/[category]/` に実装, `javascript/test/` にテスト追加。
   - **TypeScript**: `typescript/src/[category]/` に実装, `typescript/test/` にテスト追加。
   - **PowerShell**: `powershell/[category]/` に実装, `powershell/tests/` にテスト追加。

3. **動作確認**
   - 各言語のテストコマンドを実行し、Passすることを確認。

## ディレクトリ構成ルール
```
/
  /docs                     # 解説ドキュメント
  /python                   # Pythonプロジェクト (pytest)
    /src/[category]         # math, search, sort, graph, etc.
  /javascript               # JavaScriptプロジェクト (Jest)
    /src/[category]
  /typescript               # TypeScriptプロジェクト (Jest)
    /src/[category]
  /powershell               # PowerShellプロジェクト (Pester)
    /[category]
```

## カテゴリ分類
- `math`: 数学系 (GCD, 素数など)
- `search`: 探索系 (Linear, Binary, Hash, String)
- `sort`: ソート系 (Bubble, Quick, Merge, etc.)
- `graph`: グラフ・木構造系 (DFS, BFS, Dijkstra, A*)
- `dynamic`: 動的計画法
- `structure`: データ構造応用 (LRU Cache)
