String integerToWordedString(int number) {
  if (number < 0) {
    throw new UnsupportedError("Negative numbers not supported");
  } else if (number == 0) {
    return 'zero';
  } else if (_isOneToAHundredDigit(number)) {
    return _getUpToHundredDigitNumberAsString(number);
  } else if (_isThousand(number)) {
    return _getThousandAsString(number);
  } else if (_isMillion(number)) {
    return _getMillionAsString(number);
  } else if (_isBillion(number)) {
    return _getBillionAsString(number);
  } else {
    throw UnimplementedError("No support for #s > 2147483647 (2^31 - 1)!");
  }
}

String _getSingleDigitNumberAsString(int number) {
  var singleDigitNumsAsString = [
    'zero',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];
  return singleDigitNumsAsString[number];
}

String _getDoubleDigitNumberAsString(int number) {
  // 10 - 19 are a special double digit number case, since they can end in ten, eleven, or something-teen.
  if (10 <= number && number <= 19) {
    var doubleDigitNumsAsString = [
      'ten',
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen'
    ];
    return doubleDigitNumsAsString[number - 10];
  } else {
    // Otherwise, return 20-99 as string, as the strings for these #s are built consistently the same way.
    int firstDigit = number ~/ 10;
    int secondDigit = number % 10;
    var doubleDigitNumsOf20to90AsString = [
      '',
      '',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety'
    ];
    String result = doubleDigitNumsOf20to90AsString[firstDigit];
    if (secondDigit > 0) {
      result += " " + _getSingleDigitNumberAsString(secondDigit);
    }
    return result;
  }
}

String _getTripleDigitNumberAsString(int number) {
  int firstDigit = number ~/ 100;
  int lastTwoDigits = number - (firstDigit * 100);
  String resultString = _getSingleDigitNumberAsString(firstDigit) + " hundred";
  return resultString + _getLastDigitsAsString(lastTwoDigits);
}

String _getThousandAsString(int number) {
  // can be hundred thousands, ten thousands, or thousand
  int thousandDigits = number ~/ 1000;
  int lastThreeDigits = number - (thousandDigits * 1000);
  String resultString =
      _getUpToHundredDigitNumberAsString(thousandDigits) + " thousand";
  return resultString + _getLastDigitsAsString(lastThreeDigits);
}

String _getMillionAsString(int number) {
  int millionDigits = number ~/ 1000000;
  int lastSixDigits = number - (millionDigits * 1000000);
  String resultString =
      _getUpToHundredDigitNumberAsString(millionDigits) + " million";
  return resultString + _getLastDigitsAsString(lastSixDigits);
}

String _getBillionAsString(int number) {
  int billionDigit = number ~/ 1000000000;
  int lastNineDigits = number - (billionDigit * 1000000000);
  String resultString =
      _getSingleDigitNumberAsString(billionDigit) + " billion";
  return resultString + _getLastDigitsAsString(lastNineDigits);
}

String _getUpToHundredDigitNumberAsString(int number) {
  String resultString = "";
  if (_isTripleDigit(number)) {
    resultString += _getTripleDigitNumberAsString(number);
  } else if (_isDoubleDigit(number)) {
    resultString += _getDoubleDigitNumberAsString(number);
  } else if (_isSingleDigit(number)) {
    resultString += _getSingleDigitNumberAsString(number);
  }
  return resultString;
}

// the last 9 digits of a number can be 999 million or less, which we will turn into string.
String _getLastDigitsAsString(int number) {
  String lastDigitsAsString = " ";
  if (_isOneToAHundredDigit(number))
    lastDigitsAsString += _getUpToHundredDigitNumberAsString(number);
  else if (_isThousand(number))
    lastDigitsAsString += _getThousandAsString(number);
  else if (_isMillion(number))
    lastDigitsAsString += _getMillionAsString(number);
  else
    return "";
  return lastDigitsAsString;
}

bool _isSingleDigit(int number) {
  return 0 <= number && number <= 9;
}

bool _isDoubleDigit(int number) {
  return 10 <= number && number <= 99;
}

bool _isTripleDigit(int number) {
  return 100 <= number && number <= 999;
}

bool _isOneToAHundredDigit(int number) {
  return 1 <= number && number <= 999;
}

bool _isThousand(int number) {
  return 1000 <= number && number <= 999999;
}

bool _isMillion(int number) {
  return 1000000 <= number && number <= 999999999;
}

bool _isBillion(int number) {
  return 1000000000 <= number && number <= 2147483647;
}
