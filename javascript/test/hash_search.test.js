const { HashTable } = require('../src/search/hash_search');

describe('HashTable', () => {
    test('inserts and searches values', () => {
        const ht = new HashTable(5);
        ht.insert("apple", 100);
        ht.insert("banana", 200);
        
        expect(ht.search("apple")).toBe(100);
        expect(ht.search("banana")).toBe(200);
        expect(ht.search("cherry")).toBeNull();
    });

    test('updates existing value', () => {
        const ht = new HashTable(5);
        ht.insert("apple", 100);
        ht.insert("apple", 150);
        
        expect(ht.search("apple")).toBe(150);
    });

    test('handles collisions', () => {
        const ht = new HashTable(1); // Force collision
        ht.insert("a", 1);
        ht.insert("b", 2);
        
        expect(ht.search("a")).toBe(1);
        expect(ht.search("b")).toBe(2);
    });

    test('deletes values', () => {
        const ht = new HashTable(5);
        ht.insert("apple", 100);
        
        expect(ht.delete("apple")).toBe(true);
        expect(ht.search("apple")).toBeNull();
        expect(ht.delete("apple")).toBe(false);
    });
});
