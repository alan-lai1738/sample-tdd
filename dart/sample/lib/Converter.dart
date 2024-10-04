String integerToWordedString(int number) {
  if (number < 0) {
    throw new UnsupportedError("Negative numbers not supported");
  } else if (_isSingleDigit(number)) {
    return _getSingleDigitNumberAsString(number);
  } else if (_isDoubleDigit(number)) {
    return _getDoubleDigitNumberAsString(number);
  } else if (_isTripleDigit(number)) {
    return _getTripleDigitNumberAsString(number);
  } else if (_isThousand(number)) {
    return _getThousandAsString(number);
  } else {
    throw UnimplementedError("No support for #s > 99999!");
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

// only supports to 99999 as of this version
String _getThousandAsString(int number) {
  int firstTwoDigits = number ~/ 1000;
  int lastThreeDigits = number - (firstTwoDigits * 1000);
  String resultString = _getSingleDoubleOrTripleDigitNumberAsString(firstTwoDigits)+ " thousand";
  if(lastThreeDigits == 0) return resultString;
  resultString += " " + _getSingleDoubleOrTripleDigitNumberAsString(lastThreeDigits);
  return resultString;
}

String _getSingleDoubleOrTripleDigitNumberAsString(int number) {
  String resultString = "";
  if (_isTripleDigit(number)) {
    resultString += _getTripleDigitNumberAsString(number);
  } else if (_isDoubleDigit(number)) {
    resultString += _getDoubleDigitNumberAsString(number);
  } else if(_isSingleDigit(number)){
    resultString += _getSingleDigitNumberAsString(number);
  }
  return resultString;
}

String _getTripleDigitNumberAsString(int number) {
  int firstDigit = number ~/ 100;
  int lastTwoDigits = number - (firstDigit * 100);
  String resultString = _getSingleDigitNumberAsString(firstDigit) + " hundred";
  if(lastTwoDigits == 0) return resultString;
  resultString += " ";
  if (_isDoubleDigit(lastTwoDigits)) {
    resultString +=  _getDoubleDigitNumberAsString(lastTwoDigits);
  } else if(_isSingleDigit(lastTwoDigits)){
    resultString +=  _getSingleDigitNumberAsString(lastTwoDigits);
  }
  return resultString;
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

bool _isThousand(int number) {
  return 1000 <= number && number <= 999999;
}