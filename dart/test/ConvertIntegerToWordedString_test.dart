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

    test('First double-digit number greater than 19', () {
      expect(integerToWordedString(20), equals('twenty'));
    });

    test('Another double-digit number', () {
      expect(integerToWordedString(75), equals('seventy five'));
    });

    test('Last double-digit number', () {
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
      expect(
          integerToWordedString(345678),
          equals(
              'three hundred forty five thousand six hundred seventy eight'));
      expect(integerToWordedString(555555),
          equals('five hundred fifty five thousand five hundred fifty five'));
      expect(integerToWordedString(713579),
          equals('seven hundred thirteen thousand five hundred seventy nine'));
      expect(integerToWordedString(999999),
          equals('nine hundred ninety nine thousand nine hundred ninety nine'));
    });

    test('Handle seven digit numbers', () {
      expect(integerToWordedString(1000000), equals('one million'));
      expect(integerToWordedString(1000001), equals('one million one'));
      expect(integerToWordedString(2000000), equals('two million'));
      expect(
          integerToWordedString(3456789),
          equals(
              'three million four hundred fifty six thousand seven hundred eighty nine'));
      expect(
          integerToWordedString(5555555),
          equals(
              'five million five hundred fifty five thousand five hundred fifty five'));
      expect(
          integerToWordedString(7135791),
          equals(
              'seven million one hundred thirty five thousand seven hundred ninety one'));
      expect(
          integerToWordedString(9999999),
          equals(
              'nine million nine hundred ninety nine thousand nine hundred ninety nine'));
    });

    test('Handle eight digit numbers', () {
      expect(integerToWordedString(10000000), equals('ten million'));
      expect(integerToWordedString(10000001), equals('ten million one'));
      expect(integerToWordedString(20000000), equals('twenty million'));
      expect(
          integerToWordedString(34567890),
          equals(
              'thirty four million five hundred sixty seven thousand eight hundred ninety'));
      expect(
          integerToWordedString(55555555),
          equals(
              'fifty five million five hundred fifty five thousand five hundred fifty five'));
      expect(
          integerToWordedString(71357913),
          equals(
              'seventy one million three hundred fifty seven thousand nine hundred thirteen'));
      expect(
          integerToWordedString(99999999),
          equals(
              'ninety nine million nine hundred ninety nine thousand nine hundred ninety nine'));
    });

    test('Handle nine digit numbers', () {
      expect(integerToWordedString(100000000), equals('one hundred million'));
      expect(
          integerToWordedString(100000001), equals('one hundred million one'));
      expect(integerToWordedString(200000000), equals('two hundred million'));
      expect(
          integerToWordedString(345678901),
          equals(
              'three hundred forty five million six hundred seventy eight thousand nine hundred one'));
      expect(
          integerToWordedString(555555555),
          equals(
              'five hundred fifty five million five hundred fifty five thousand five hundred fifty five'));
      expect(
          integerToWordedString(713579135),
          equals(
              'seven hundred thirteen million five hundred seventy nine thousand one hundred thirty five'));
      expect(
          integerToWordedString(999999999),
          equals(
              'nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine'));
    });

    test('Handle ten digit numbers', () {
      expect(integerToWordedString(1000000000), equals('one billion'));
      expect(integerToWordedString(1000000001), equals('one billion one'));
      expect(integerToWordedString(1500000000),
          equals('one billion five hundred million'));
      expect(integerToWordedString(1000000005), equals('one billion five'));
      expect(
          integerToWordedString(1234567890),
          equals(
              'one billion two hundred thirty four million five hundred sixty seven thousand eight hundred ninety'));
      expect(integerToWordedString(2000000009), equals('two billion nine'));
      expect(integerToWordedString(2140000000),
          equals('two billion one hundred forty million'));
      expect(
          integerToWordedString(2147483647),
          equals(
              'two billion one hundred forty seven million four hundred eighty three thousand six hundred forty seven'));
    });
  });
}
