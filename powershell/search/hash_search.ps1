class SimpleHashTable {
    [int]$Size
    [System.Collections.ArrayList[]]$Table

    SimpleHashTable([int]$size) {
        $this.Size = $size
        $this.Table = [System.Collections.ArrayList[]]::new($size)
        for ($i = 0; $i -lt $size; $i++) {
            $this.Table[$i] = [System.Collections.ArrayList]::new()
        }
    }

    [int] GetHash([object]$key) {
        $strKey = $key.ToString()
        $hash = 0
        foreach ($char in $strKey.ToCharArray()) {
            $hash = ($hash + [int]$char) % $this.Size
        }
        return $hash
    }

    [void] Insert([object]$key, [object]$value) {
        $index = $this.GetHash($key)
        $bucket = $this.Table[$index]

        foreach ($item in $bucket) {
            if ($item.Key -eq $key) {
                $item.Value = $value
                return
            }
        }

        $newItem = [PSCustomObject]@{ Key = $key; Value = $value }
        [void]$bucket.Add($newItem)
    }

    [object] Search([object]$key) {
        $index = $this.GetHash($key)
        $bucket = $this.Table[$index]

        foreach ($item in $bucket) {
            if ($item.Key -eq $key) {
                return $item.Value
            }
        }

        return $null
    }

    [bool] Delete([object]$key) {
        $index = $this.GetHash($key)
        $bucket = $this.Table[$index]

        for ($i = 0; $i -lt $bucket.Count; $i++) {
            if ($bucket[$i].Key -eq $key) {
                $bucket.RemoveAt($i)
                return $true
            }
        }

        return $false
    }
}
