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
  });
}
