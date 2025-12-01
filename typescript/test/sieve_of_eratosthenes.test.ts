import { sieveOfEratosthenes } from '../src/math/sieve_of_eratosthenes';

describe('Sieve of Eratosthenes', () => {
    test('finds primes up to 30', () => {
        const n = 30;
        const expected = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29];
        expect(sieveOfEratosthenes(n)).toEqual(expected);
    });

    test('finds primes up to 10', () => {
        expect(sieveOfEratosthenes(10)).toEqual([2, 3, 5, 7]);
    });

    test('finds primes up to 2', () => {
        expect(sieveOfEratosthenes(2)).toEqual([2]);
    });

    test('returns empty array for n < 2', () => {
        expect(sieveOfEratosthenes(1)).toEqual([]);
        expect(sieveOfEratosthenes(0)).toEqual([]);
        expect(sieveOfEratosthenes(-10)).toEqual([]);
    });
});
