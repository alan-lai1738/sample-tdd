import 'package:test/test.dart';
import '../sample/lib/converter.dart'; // Dart import syntax

void main() {
  group('ConvertIntegerToWordedStringTests', () {
    test('Handle single digit numbers', () {
      expect(integerToWordedString(0), equals('zero'));
      expect(integerToWordedString(1), equals('one'));
      expect(integerToWordedString(2), equals('two'));
      expect(integerToWordedString(9), equals('nine'));
    });

    test('Negative numbers are not allowed', () {
      expect(() => integerToWordedString(-1), throwsA(isA<UnsupportedError>()));
    });

    test('Handle double digit numbers that start with 1', () {
      expect(integerToWordedString(10), equals('ten'));
      expect(integerToWordedString(11), equals('eleven'));
      expect(integerToWordedString(12), equals('twelve'));
      expect(integerToWordedString(19), equals('nineteen'));
    });

    test('Handle double digit numbers from 20 to 99', () {
      expect(integerToWordedString(20), equals('twenty'));
      expect(integerToWordedString(21), equals('twenty one'));
      expect(integerToWordedString(22), equals('twenty two'));
      expect(integerToWordedString(30), equals('thirty'));
      expect(integerToWordedString(60), equals('sixty'));
      expect(integerToWordedString(75), equals('seventy five'));
      expect(integerToWordedString(99), equals('ninety nine'));
    });

    test('Handle triple digit numbers', () {
      expect(integerToWordedString(100), equals('one hundred'));
      expect(integerToWordedString(101), equals('one hundred one'));
      expect(integerToWordedString(102), equals('one hundred two'));
      expect(integerToWordedString(200), equals('two hundred'));
      expect(integerToWordedString(300), equals('three hundred'));
      expect(integerToWordedString(555), equals('five hundred fifty five'));
      expect(integerToWordedString(715), equals('seven hundred fifteen'));
      expect(integerToWordedString(999), equals('nine hundred ninety nine'));
    });

    test('Handle four digit numbers', () {
      expect(integerToWordedString(1000), equals('one thousand'));
      expect(integerToWordedString(1001), equals('one thousand one'));
      expect(integerToWordedString(1002), equals('one thousand two'));
      expect(integerToWordedString(2000), equals('two thousand'));
      expect(integerToWordedString(3456),
          equals('three thousand four hundred fifty six'));
      expect(integerToWordedString(5555),
          equals('five thousand five hundred fifty five'));
      expect(integerToWordedString(7135),
          equals('seven thousand one hundred thirty five'));
      expect(integerToWordedString(9999),
          equals('nine thousand nine hundred ninety nine'));
    });

    test('Handle five digit numbers', () {
      expect(integerToWordedString(10000), equals('ten thousand'));
      expect(integerToWordedString(10001), equals('ten thousand one'));
      expect(integerToWordedString(10002), equals('ten thousand two'));
      expect(integerToWordedString(20000), equals('twenty thousand'));
      expect(integerToWordedString(34567),
          equals('thirty four thousand five hundred sixty seven'));
      expect(integerToWordedString(55555),
          equals('fifty five thousand five hundred fifty five'));
      expect(integerToWordedString(71357),
          equals('seventy one thousand three hundred fifty seven'));
      expect(integerToWordedString(99999),
          equals('ninety nine thousand nine hundred ninety nine'));
    });

    test('Handle six digit numbers', () {
      expect(integerToWordedString(100000), equals('one hundred thousand'));
      expect(integerToWordedString(100001), equals('one hundred thousand one'));
      expect(integerToWordedString(200000), equals('two hundred thousand'));
      expect(integerToWordedString(345678), equals('three hundred forty five thousand six hundred seventy eight'));
      expect(integerToWordedString(555555), equals('five hundred fifty five thousand five hundred fifty five'));
      expect(integerToWordedString(713579), equals('seven hundred thirteen thousand five hundred seventy nine'));
      expect(integerToWordedString(999999), equals('nine hundred ninety nine thousand nine hundred ninety nine'));
    });

  });
}
