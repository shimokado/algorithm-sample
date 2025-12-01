<#
.SYNOPSIS
    連鎖法（Chaining）を用いたハッシュテーブルの実装モジュール

.DESCRIPTION
    このモジュールは、ハッシュの衝突を連鎖法で解決するハッシュテーブルを
    実装しています。平均O(1)の時間計算量でデータの操作が可能です。

    ハッシュテーブルの構造:
    - テーブル（配列）: 固定サイズの配列
    - バケット（bucket）: テーブルの各スロットに格納されるArrayList
    - ハッシュ関数: キーをテーブルのインデックスに変換する関数

    時間計算量:
    - 平均: O(1) - ハッシュの衝突が少ない場合
    - 最悪: O(n) - 全てのキーが同じバケットに格納された場合
#>

class SimpleHashTable {
    # テーブルのサイズ（バケットの数）
    [int]$Size

    # ハッシュテーブルの本体（バケットの配列）
    # 各バケットはSystem.Collections.ArrayListで実装
    [System.Collections.ArrayList[]]$Table

    <#
    .SYNOPSIS
        ハッシュテーブルを指定されたサイズで初期化します。

    .PARAMETER size
        テーブルのサイズ（バケットの数）
    #>
    SimpleHashTable([int]$size) {
        # テーブルのサイズを保存
        $this.Size = $size

        # テーブルを初期化
        # 各バケットは空のArrayListとして初期化される
        $this.Table = [System.Collections.ArrayList[]]::new($size)
        for ($i = 0; $i -lt $size; $i++) {
            $this.Table[$i] = [System.Collections.ArrayList]::new()
        }
    }

    <#
    .SYNOPSIS
        キーからハッシュ値（テーブルのインデックス）を計算します。

    .DESCRIPTION
        キーの各文字のASCIIコードを合計し、テーブルサイズで割った余りを
        ハッシュ値とします。

    .PARAMETER key
        ハッシュ化するキー

    .OUTPUTS
        [int] 0からSize-1の範囲のハッシュ値
    #>
    [int] GetHash([object]$key) {
        # キーを文字列に変換
        $strKey = $key.ToString()
        $hash = 0

        # 各文字のASCIIコードを合計
        foreach ($char in $strKey.ToCharArray()) {
            # [int]$char で文字のASCIIコードを取得
            # ハッシュ値がテーブルサイズを超えないよう、毎回余りを取る
            $hash = ($hash + [int]$char) % $this.Size
        }
        return $hash
    }

    <#
    .SYNOPSIS
        キーと値のペアをハッシュテーブルに挿入します。
        同じキーが既に存在する場合は、値を更新します。

    .PARAMETER key
        挿入するキー

    .PARAMETER value
        挿入する値
    #>
    [void] Insert([object]$key, [object]$value) {
        # キーのハッシュ値を計算し、対応するバケットを取得
        $index = $this.GetHash($key)
        $bucket = $this.Table[$index]

        # バケット内で同じキーを持つ要素を探す
        foreach ($item in $bucket) {
            if ($item.Key -eq $key) {
                # 既存のキーが見つかった場合、値を更新して終了
                $item.Value = $value
                return
            }
        }

        # 同じキーが存在しない場合、新しい要素をバケットの末尾に追加
        # PSCustomObject でキーと値のペアを作成
        $newItem = [PSCustomObject]@{ Key = $key; Value = $value }
        [void]$bucket.Add($newItem)
    }

    <#
    .SYNOPSIS
        指定されたキーに対応する値を検索します。

    .PARAMETER key
        検索するキー

    .OUTPUTS
        [object] 見つかった場合は値、見つからない場合は $null
    #>
    [object] Search([object]$key) {
        # キーのハッシュ値を計算し、対応するバケットを取得
        $index = $this.GetHash($key)
        $bucket = $this.Table[$index]

        # バケット内で同じキーを持つ要素を探す
        foreach ($item in $bucket) {
            if ($item.Key -eq $key) {
                # キーが見つかった場合、対応する値を返す
                return $item.Value
            }
        }

        # キーが見つからなかった場合は $null を返す
        return $null
    }

    <#
    .SYNOPSIS
        指定されたキーに対応する要素を削除します。

    .PARAMETER key
        削除するキー

    .OUTPUTS
        [bool] 削除に成功した場合は $true、キーが存在しない場合は $false
    #>
    [bool] Delete([object]$key) {
        # キーのハッシュ値を計算し、対応するバケットを取得
        $index = $this.GetHash($key)
        $bucket = $this.Table[$index]

        # バケット内で同じキーを持つ要素を探す
        for ($i = 0; $i -lt $bucket.Count; $i++) {
            if ($bucket[$i].Key -eq $key) {
                # キーが見つかった場合、その要素をArrayListから削除
                # RemoveAt でインデックス $i の要素を削除
                $bucket.RemoveAt($i)
                return $true
            }
        }

        # キーが見つからなかった場合は $false を返す
        return $false
    }
}
