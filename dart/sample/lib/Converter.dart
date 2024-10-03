
String integerToWordedString(int number) {
  if(number < 0) {
    throw new UnsupportedError("Negative numbers not supported");
  } else if(0 <= number && number <= 9) {
    return _getSingleDigitNumberAsString(number);
  } else if(10 <= number && number <= 19) {
    return _getDoubleDigitNumber10to19AsString(number);
  } else {
    throw UnimplementedError("No support for #s > 19!");
  }
}

String _getSingleDigitNumberAsString(int number) {
  var singleDigitNumsAsString = ['zero','one','two','three','four','five','six','seven','eight','nine'];
  return singleDigitNumsAsString[number];
}

String _getDoubleDigitNumber10to19AsString(int number) {
  var doubleDigitNumsAsString = ['ten','eleven','twelve','thirteen','fourteen','fiveteen','sixteen','seventeen','eighteen','nineteen'];
  return doubleDigitNumsAsString[number - 10];
}
