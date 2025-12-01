import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from search.hash_search import HashTable

def test_hash_table_basic():
    ht = HashTable(size=5)
    ht.insert("apple", 100)
    ht.insert("banana", 200)
    ht.insert("cherry", 300)
    
    assert ht.search("apple") == 100
    assert ht.search("banana") == 200
    assert ht.search("cherry") == 300
    assert ht.search("durian") is None

def test_hash_table_update():
    ht = HashTable(size=5)
    ht.insert("apple", 100)
    assert ht.search("apple") == 100
    
    ht.insert("apple", 150)
    assert ht.search("apple") == 150

def test_hash_table_collision():
    # Force collision by using small size
    ht = HashTable(size=1)
    ht.insert("a", 1)
    ht.insert("b", 2)
    
    assert ht.search("a") == 1
    assert ht.search("b") == 2

def test_hash_table_delete():
    ht = HashTable(size=5)
    ht.insert("apple", 100)
    assert ht.search("apple") == 100
    
    assert ht.delete("apple") is True
    assert ht.search("apple") is None
    assert ht.delete("apple") is False
