import 'package:test/test.dart';
import '../sample/lib/converter.dart'; // Dart import syntax

void main() {
  group('ConvertIntegerToWordedStringTests', () {
    test('first positive integer is one', () {
      var number = 1;
      var words = integerToWordedString(number);
      expect(words.toLowerCase(), equals('one'));
    });

    test('Handle single digit integers of -9 to 9', () {
      expect(integerToWordedString(0), 'zero');
      expect(integerToWordedString(2), 'two');
      expect(integerToWordedString(5), 'five');
      expect(integerToWordedString(9), 'nine');
      expect(integerToWordedString(-9), 'negative nine');
      expect(integerToWordedString(-0), 'zero');
    });

    test('First negative integer is -1', () {
      var number = -1;
      var words = integerToWordedString(number);
      expect(words.toLowerCase(), equals('negative one'));
    });

    test('Handle 10 to 19', () {
      expect(integerToWordedString(10), 'ten');
      expect(integerToWordedString(11), 'eleven');
      expect(integerToWordedString(19), 'nineteen');
    });

    test('Handle 20, 21, 99', () {
      expect(integerToWordedString(20), 'twenty');
      expect(integerToWordedString(21), 'twenty one');
      expect(integerToWordedString(22), 'twenty two');
      expect(integerToWordedString(99), 'ninety nine');
    });
  });
}
