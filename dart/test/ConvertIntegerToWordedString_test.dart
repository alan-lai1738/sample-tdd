import 'package:test/test.dart';
import '../sample/lib/converter.dart';   // Dart import syntax

void main() {
  group('ConvertIntegerToWordedStringTests', () {
    test('first positive integer is one', () {
      var number = 1;
      var words = integerToWordedString(number);
      expect(words.toLowerCase(), equals('one'));
    });

    test('First negative integer is -1', () {
      var number = -1;
      var words = integerToWordedString(number);
      expect(words.toLowerCase(), equals('negative one'));
    });
  });
}