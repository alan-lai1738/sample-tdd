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
      expect(integerToWordedString(-0), 'zero');
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

    test('Handle 100, 101, 102, 111, 222, 999', () {
      expect(integerToWordedString(100), 'one hundred');
      expect(integerToWordedString(101), 'one hundred one');
      expect(integerToWordedString(102), 'one hundred two');
      expect(integerToWordedString(111), 'one hundred eleven');
      expect(integerToWordedString(222), 'two hundred twenty two');
      expect(integerToWordedString(999), 'nine hundred ninety nine');
    });

    test('Handle 1000, 1001, 1002, 1011, 1111, 2222, 9999', () {
      expect(integerToWordedString(1000), 'one thousand');
      expect(integerToWordedString(1001), 'one thousand one');
      expect(integerToWordedString(1002), 'one thousand two');
      expect(integerToWordedString(1011), 'one thousand eleven');
      expect(integerToWordedString(1111), 'one thousand one hundred eleven');
      expect(
          integerToWordedString(2222), 'two thousand two hundred twenty two');
      expect(integerToWordedString(9999),
          'nine thousand nine hundred ninety nine');
    });

    test('Handle 10000, 10001, 10111, 11111, 21234, 67892, 99999', () {
      expect(integerToWordedString(10000), 'ten thousand');
      expect(integerToWordedString(10001), 'ten thousand one');
      expect(integerToWordedString(10111), 'ten thousand one hundred eleven');
      expect(
          integerToWordedString(11111), 'eleven thousand one hundred eleven');
      expect(integerToWordedString(21234),
          'twenty one thousand two hundred thirty four');
      expect(integerToWordedString(67892),
          'sixty seven thousand eight hundred ninety two');
      expect(integerToWordedString(99999),
          'ninety nine thousand nine hundred ninety nine');
    });

    test('Handle 100000, 100001, 101111, 111111, 212345, 678921, 999999', () {
      expect(integerToWordedString(100000), 'one hundred thousand');
      expect(integerToWordedString(100001), 'one hundred thousand one');
      expect(integerToWordedString(101111),
          'one hundred one thousand one hundred eleven');
      expect(integerToWordedString(111111),
          'one hundred eleven thousand one hundred eleven');
      expect(integerToWordedString(212345),
          'two hundred twelve thousand three hundred forty five');
      expect(integerToWordedString(678921),
          'six hundred seventy eight thousand nine hundred twenty one');
      expect(integerToWordedString(999999),
          'nine hundred ninety nine thousand nine hundred ninety nine');
    });
  });
}
