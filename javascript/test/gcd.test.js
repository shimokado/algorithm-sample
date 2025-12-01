const { gcd } = require('../src/math/gcd');

describe('GCD', () => {
    test('calculates gcd of positive integers', () => {
        expect(gcd(48, 18)).toBe(6);
        expect(gcd(1071, 1029)).toBe(21);
    });

    test('calculates gcd with zero', () => {
        expect(gcd(5, 0)).toBe(5);
        expect(gcd(0, 5)).toBe(5);
        expect(gcd(0, 0)).toBe(0);
    });

    test('calculates gcd of negative integers', () => {
        expect(gcd(-48, 18)).toBe(6);
        expect(gcd(48, -18)).toBe(6);
        expect(gcd(-48, -18)).toBe(6);
    });

    test('calculates gcd of prime numbers', () => {
        expect(gcd(17, 13)).toBe(1);
    });
});
