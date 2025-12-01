import { quickSort } from '../src/sort/quick_sort';

describe('Quick Sort', () => {
    test('sorts array of numbers', () => {
        const data = [10, 7, 8, 9, 1, 5];
        const expected = [1, 5, 7, 8, 9, 10];
        expect(quickSort(data)).toEqual(expected);
    });

    test('sorts already sorted array', () => {
        const data = [1, 2, 3, 4, 5];
        const expected = [1, 2, 3, 4, 5];
        expect(quickSort(data)).toEqual(expected);
    });

    test('sorts reverse sorted array', () => {
        const data = [5, 4, 3, 2, 1];
        const expected = [1, 2, 3, 4, 5];
        expect(quickSort(data)).toEqual(expected);
    });

    test('sorts array with duplicates', () => {
        const data = [4, 2, 4, 2, 1];
        const expected = [1, 2, 2, 4, 4];
        expect(quickSort(data)).toEqual(expected);
    });

    test('handles empty array', () => {
        const data: number[] = [];
        const expected: number[] = [];
        expect(quickSort(data)).toEqual(expected);
    });
});
