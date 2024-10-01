
String integerToWordedString(int number) {
  if(number == 0) {
    return 'zero';
  }
  if(number > 9) {
    throw new UnimplementedError("integerToWordedString does not support absolute value numbers greater than 9");
  }
  List<String> words = [];

  if (number < 0) {
    words.add("negative");
    number = -number;
  }

  words.add(_getSingleDigitAsWordString(number));

  return _convertWordsArrayIntoStringThatHasFormattedSpaces(words);
}

String _convertWordsArrayIntoStringThatHasFormattedSpaces(List<String> words) {
  String res = "";
  int i = 0;
  while(i < words.length) {
    res += words[i];
    if(i+1 < words.length) {
      res += " ";
    }
    i++;
  }
  return res;
}

String _getSingleDigitAsWordString(int number) {
  switch(number) {
    case 0:
      return 'zero';
    case 1:
        return 'one';
    case 2:
        return 'two';
    case 3:
        return 'three';
    case 4:
        return 'four';
    case 5:
      return 'five';
    case 6:
        return 'six';
    case 7:
        return 'seven';
    case 8:
        return 'eight';
    case 9:
        return 'nine';
    default:
        return '';
  }
}