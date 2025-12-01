const { binarySearch } = require('../src/search/binary_search');

describe('Binary Search', () => {
    test('finds element in sorted array', () => {
        const data = [10, 20, 30, 40, 50];
        expect(binarySearch(data, 30)).toBe(2);
        expect(binarySearch(data, 10)).toBe(0);
        expect(binarySearch(data, 50)).toBe(4);
    });

    test('returns -1 when element not found', () => {
        const data = [10, 20, 30, 40, 50];
        expect(binarySearch(data, 25)).toBe(-1);
        expect(binarySearch(data, 5)).toBe(-1);
        expect(binarySearch(data, 55)).toBe(-1);
    });

    test('works with empty array', () => {
        const data = [];
        expect(binarySearch(data, 10)).toBe(-1);
    });
});
