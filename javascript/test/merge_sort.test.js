const { mergeSort } = require('../src/sort/merge_sort');

describe('Merge Sort', () => {
    test('sorts array of numbers', () => {
        const data = [12, 11, 13, 5, 6, 7];
        const expected = [5, 6, 7, 11, 12, 13];
        expect(mergeSort(data)).toEqual(expected);
    });

    test('sorts already sorted array', () => {
        const data = [1, 2, 3, 4, 5];
        const expected = [1, 2, 3, 4, 5];
        expect(mergeSort(data)).toEqual(expected);
    });

    test('sorts reverse sorted array', () => {
        const data = [5, 4, 3, 2, 1];
        const expected = [1, 2, 3, 4, 5];
        expect(mergeSort(data)).toEqual(expected);
    });

    test('sorts array with duplicates', () => {
        const data = [4, 2, 4, 2, 1];
        const expected = [1, 2, 2, 4, 4];
        expect(mergeSort(data)).toEqual(expected);
    });

    test('handles empty array', () => {
        const data = [];
        const expected = [];
        expect(mergeSort(data)).toEqual(expected);
    });
});
