import 'package:test/test.dart';
import '../sample/lib/converter.dart'; // Dart import syntax

void main() {
  group('Single Digit Numbers', () {
    test('Convert 0 to "zero"', () {
      expect(integerToWordedString(0), equals('zero'));
    });

    test('Convert 1 to "one"', () {
      expect(integerToWordedString(1), equals('one'));
    });

    test('Convert 2 to "two"', () {
      expect(integerToWordedString(2), equals('two'));
    });

    test('Convert 9 to "nine"', () {
      expect(integerToWordedString(9), equals('nine'));
    });
  });

  group('Double Digit Numbers', () {
    group('10-19 Special Cases', () {
      test('Convert 10 to "ten"', () {
        expect(integerToWordedString(10), equals('ten'));
      });

      test('Convert 11 to "eleven"', () {
        expect(integerToWordedString(11), equals('eleven'));
      });

      test('Convert 12 to "twelve"', () {
        expect(integerToWordedString(12), equals('twelve'));
      });

      test('Convert 19 to "nineteen"', () {
        expect(integerToWordedString(19), equals('nineteen'));
      });
    });

    group('20-99 General Cases', () {
      test('Convert 20 to "twenty"', () {
        expect(integerToWordedString(20), equals('twenty'));
      });

      test('Convert 75 to "seventy five"', () {
        expect(integerToWordedString(75), equals('seventy five'));
      });

      test('Convert 99 to "ninety nine"', () {
        expect(integerToWordedString(99), equals('ninety nine'));
      });
    });
  });

  group('Triple Digit Numbers', () {
    test('Convert 100 to "one hundred"', () {
      expect(integerToWordedString(100), equals('one hundred'));
    });

    test('Convert 555 to "five hundred fifty five"', () {
      expect(integerToWordedString(555), equals('five hundred fifty five'));
    });

    test('Convert 999 to "nine hundred ninety nine"', () {
      expect(integerToWordedString(999), equals('nine hundred ninety nine'));
    });
  });

  group('Four Digit Numbers', () {
    test('Convert 1000 to "one thousand"', () {
      expect(integerToWordedString(1000), equals('one thousand'));
    });

    test('Convert 1001 to "one thousand one"', () {
      expect(integerToWordedString(1001), equals('one thousand one'));
    });

    test('Convert 3456 to "three thousand four hundred fifty six"', () {
      expect(integerToWordedString(3456), equals('three thousand four hundred fifty six'));
    });

    test('Convert 9999 to "nine thousand nine hundred ninety nine"', () {
      expect(integerToWordedString(9999), equals('nine thousand nine hundred ninety nine'));
    });
  });

  group('Five Digit Numbers', () {
    test('Convert 10000 to "ten thousand"', () {
      expect(integerToWordedString(10000), equals('ten thousand'));
    });

    test('Convert 20000 to "twenty thousand"', () {
      expect(integerToWordedString(20000), equals('twenty thousand'));
    });

    test('Convert 34567 to "thirty four thousand five hundred sixty seven"', () {
      expect(integerToWordedString(34567), equals('thirty four thousand five hundred sixty seven'));
    });

    test('Convert 99999 to "ninety nine thousand nine hundred ninety nine"', () {
      expect(integerToWordedString(99999), equals('ninety nine thousand nine hundred ninety nine'));
    });
  });

  group('Six Digit Numbers', () {
    test('Convert 100000 to "one hundred thousand"', () {
      expect(integerToWordedString(100000), equals('one hundred thousand'));
    });

    test('Convert 345678 to "three hundred forty five thousand six hundred seventy eight"', () {
      expect(integerToWordedString(345678), equals('three hundred forty five thousand six hundred seventy eight'));
    });

    test('Convert 999999 to "nine hundred ninety nine thousand nine hundred ninety nine"', () {
      expect(integerToWordedString(999999), equals('nine hundred ninety nine thousand nine hundred ninety nine'));
    });
  });

  group('Seven Digit Numbers (Millions)', () {
    test('Convert 1000000 to "one million"', () {
      expect(integerToWordedString(1000000), equals('one million'));
    });

    test('Convert 3456789 to "three million four hundred fifty six thousand seven hundred eighty nine"', () {
      expect(integerToWordedString(3456789), equals('three million four hundred fifty six thousand seven hundred eighty nine'));
    });

    test('Convert 9999999 to "nine million nine hundred ninety nine thousand nine hundred ninety nine"', () {
      expect(integerToWordedString(9999999), equals('nine million nine hundred ninety nine thousand nine hundred ninety nine'));
    });
  });

  group('Eight Digit Numbers (Ten Millions)', () {
    test('Convert 10000000 to "ten million"', () {
      expect(integerToWordedString(10000000), equals('ten million'));
    });

    test('Convert 34567890 to "thirty four million five hundred sixty seven thousand eight hundred ninety"', () {
      expect(integerToWordedString(34567890), equals('thirty four million five hundred sixty seven thousand eight hundred ninety'));
    });

    test('Convert 99999999 to "ninety nine million nine hundred ninety nine thousand nine hundred ninety nine"', () {
      expect(integerToWordedString(99999999), equals('ninety nine million nine hundred ninety nine thousand nine hundred ninety nine'));
    });
  });

  group('Nine Digit Numbers (Hundreds of Millions)', () {
    test('Convert 100000000 to "one hundred million"', () {
      expect(integerToWordedString(100000000), equals('one hundred million'));
    });

    test('Convert 345678901 to "three hundred forty five million six hundred seventy eight thousand nine hundred one"', () {
      expect(integerToWordedString(345678901), equals('three hundred forty five million six hundred seventy eight thousand nine hundred one'));
    });

    test('Convert 999999999 to "nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine"', () {
      expect(integerToWordedString(999999999), equals('nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine'));
    });
  });

  group('Ten Digit Numbers (Billions)', () {
    test('Convert 1000000000 to "one billion"', () {
      expect(integerToWordedString(1000000000), equals('one billion'));
    });

    test('Convert 1234567890 to "one billion two hundred thirty four million five hundred sixty seven thousand eight hundred ninety"', () {
      expect(integerToWordedString(1234567890), equals('one billion two hundred thirty four million five hundred sixty seven thousand eight hundred ninety'));
    });

    test('Convert 2147483647 to "two billion one hundred forty seven million four hundred eighty three thousand six hundred forty seven"', () {
      expect(integerToWordedString(2147483647), equals('two billion one hundred forty seven million four hundred eighty three thousand six hundred forty seven'));
    });
  });

  group('Error Cases', () {
    test('Negative numbers are not allowed', () {
      expect(() => integerToWordedString(-1), throwsA(isA<UnsupportedError>()));
    });
  });
}
