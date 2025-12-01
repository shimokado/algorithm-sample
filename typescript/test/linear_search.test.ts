import { linearSearch } from '../src/search/linear_search';

describe('Linear Search', () => {
    test('finds element in array', () => {
        const data = [10, 20, 30, 40, 50];
        expect(linearSearch(data, 30)).toBe(2);
        expect(linearSearch(data, 10)).toBe(0);
        expect(linearSearch(data, 50)).toBe(4);
    });

    test('returns -1 when element not found', () => {
        const data = [10, 20, 30, 40, 50];
        expect(linearSearch(data, 99)).toBe(-1);
    });

    test('works with empty array', () => {
        const data: number[] = [];
        expect(linearSearch(data, 10)).toBe(-1);
    });

    test('works with strings', () => {
        const data = ["apple", "banana", "cherry"];
        expect(linearSearch(data, "banana")).toBe(1);
        expect(linearSearch(data, "grape")).toBe(-1);
    });
});
