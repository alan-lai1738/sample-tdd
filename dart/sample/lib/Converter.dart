
String integerToWordedString(int number) {
  if(number < 0) {
    throw new UnsupportedError("Negative numbers not supported");
  } else if(0 <= number && number <= 9) {
    return _getSingleDigitNumberAsString(number);
  } else {
    throw UnimplementedError("No support for #s > 9!");
  }
}

String _getSingleDigitNumberAsString(int number) {
  var singleDigitNumsAsString = ['zero','one','two','three','four','five','six','seven','eight','nine'];
  return singleDigitNumsAsString[number];
}
