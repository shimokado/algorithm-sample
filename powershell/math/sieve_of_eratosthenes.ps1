<#
.SYNOPSIS
    エラトステネスのふるいを用いた素数列挙モジュール

.DESCRIPTION
    このモジュールは、指定された上限値以下の全ての素数を効率的に求める
    エラトステネスのふるいアルゴリズムを実装しています。

    時間計算量: O(n log log n)
    空間計算量: O(n)
#>

function Get-PrimesSieve {
    <#
    .SYNOPSIS
        エラトステネスのふるいを用いて、n以下の素数のリストを返します。

    .DESCRIPTION
        エラトステネスのふるいは、古代ギリシャの数学者エラトステネスが考案した
        素数を見つけるための効率的なアルゴリズムです。

        アルゴリズムの手順:
        1. 2からnまでの全ての数を「素数候補」としてマークする
        2. 最小の素数候補（最初は2）を選ぶ
        3. その数の倍数を全て「素数ではない」としてマークする
        4. 次の素数候補を選び、手順3を繰り返す
        5. p * p > n になったら終了

    .PARAMETER N
        上限値（この値以下の素数を全て求める）

    .OUTPUTS
        [int[]] n以下の素数を昇順に並べた配列

    .EXAMPLE
        Get-PrimesSieve -N 30
        # 出力: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29
    #>
    param (
        [Parameter(Mandatory=$true)]
        [int]$N
    )

    # 2より小さい場合、素数は存在しない
    # 素数の定義: 1より大きく、1とその数自身以外に約数を持たない自然数
    if ($N -lt 2) {
        return @()
    }

    # $isPrime[$i] = $true の場合、$iは素数の候補
    # 初期状態では全ての数を素数候補（$true）とする
    $isPrime = [bool[]]::new($N + 1)
    for ($i = 0; $i -le $N; $i++) { $isPrime[$i] = $true }

    # 0と1は素数ではないので、$falseに設定
    $isPrime[0] = $false
    $isPrime[1] = $false

    # $pの倍数をふるい落とす処理
    # $p * $p > $N になったら終了（それ以降の倍数は既にふるい落とされている）
    $p = 2
    while ($p * $p -le $N) {
        # $pが素数候補の場合のみ処理を行う
        if ($isPrime[$p]) {
            # $pの倍数を全て素数ではないとマーク
            # $p * $p から始める理由: $p * 2, $p * 3, ... , $p * ($p-1) は
            # より小さい素数の倍数として既にふるい落とされているため
            for ($i = $p * $p; $i -le $N; $i += $p) {
                $isPrime[$i] = $false
            }
        }
        # 次の数へ進む
        $p++
    }

    # 素数のリストを作成
    # $isPrime配列で$trueになっている全てのインデックスが素数
    $primes = @()
    for ($i = 2; $i -le $N; $i++) {
        if ($isPrime[$i]) {
            $primes += $i
        }
    }

    # PowerShellで配列を正しく返すために、カンマ演算子を使用
    return ,$primes
}
