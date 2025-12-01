const { bubbleSort } = require('../src/sort/bubble_sort');

describe('Bubble Sort', () => {
    test('sorts array of numbers', () => {
        const data = [64, 34, 25, 12, 22, 11, 90];
        const expected = [11, 12, 22, 25, 34, 64, 90];
        expect(bubbleSort(data)).toEqual(expected);
    });

    test('sorts already sorted array', () => {
        const data = [1, 2, 3, 4, 5];
        const expected = [1, 2, 3, 4, 5];
        expect(bubbleSort(data)).toEqual(expected);
    });

    test('sorts reverse sorted array', () => {
        const data = [5, 4, 3, 2, 1];
        const expected = [1, 2, 3, 4, 5];
        expect(bubbleSort(data)).toEqual(expected);
    });

    test('handles empty array', () => {
        const data = [];
        const expected = [];
        expect(bubbleSort(data)).toEqual(expected);
    });
});
