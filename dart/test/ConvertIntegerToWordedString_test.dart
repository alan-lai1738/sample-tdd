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
  });
}
