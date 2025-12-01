const { selectionSort } = require('../src/sort/selection_sort');

describe('Selection Sort', () => {
    test('sorts array of numbers', () => {
        const data = [64, 25, 12, 22, 11];
        const expected = [11, 12, 22, 25, 64];
        expect(selectionSort(data)).toEqual(expected);
    });

    test('sorts already sorted array', () => {
        const data = [1, 2, 3, 4, 5];
        const expected = [1, 2, 3, 4, 5];
        expect(selectionSort(data)).toEqual(expected);
    });

    test('sorts reverse sorted array', () => {
        const data = [5, 4, 3, 2, 1];
        const expected = [1, 2, 3, 4, 5];
        expect(selectionSort(data)).toEqual(expected);
    });

    test('handles empty array', () => {
        const data = [];
        const expected = [];
        expect(selectionSort(data)).toEqual(expected);
    });
});
