$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Parent $here) + "\search\hash_search.ps1"
. $sut

Describe "SimpleHashTable" {
    It "inserts and searches values" {
        $ht = [SimpleHashTable]::new(5)
        $ht.Insert("apple", 100)
        $ht.Insert("banana", 200)
        
        $ht.Search("apple") | Should Be 100
        $ht.Search("banana") | Should Be 200
        $ht.Search("cherry") | Should Be $null
    }

    It "updates existing value" {
        $ht = [SimpleHashTable]::new(5)
        $ht.Insert("apple", 100)
        $ht.Insert("apple", 150)
        
        $ht.Search("apple") | Should Be 150
    }

    It "handles collisions" {
        $ht = [SimpleHashTable]::new(1) # Force collision
        $ht.Insert("a", 1)
        $ht.Insert("b", 2)
        
        $ht.Search("a") | Should Be 1
        $ht.Search("b") | Should Be 2
    }

    It "deletes values" {
        $ht = [SimpleHashTable]::new(5)
        $ht.Insert("apple", 100)
        
        $ht.Delete("apple") | Should Be $true
        $ht.Search("apple") | Should Be $null
        $ht.Delete("apple") | Should Be $false
    }
}
