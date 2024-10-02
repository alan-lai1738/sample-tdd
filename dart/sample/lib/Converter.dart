
String integerToWordedString(int number) {
  if(number == 0) {
    return 'zero';
  }
  if(number > 999999) {
    throw new UnimplementedError("integerToWordedString does not support absolute value numbers greater than 999999");
  }
  if(number < 1000) {
    return _getValue0to999AsString(number);
  } else {
    List<int> numberSplitUp = _splitNumbers(number);
    List<String> words = [];
    List<String> numberNames = [" thousand"];
    for(int i = 0; i < numberSplitUp.length; i++) {
      if(numberSplitUp[i] != 0) {
        // we don't need to add a numberName for when the three digits are less than 1000
        String numAsString = _getValue0to999AsString(numberSplitUp[i]) + ((i < 1) ? numberNames[i] : "");
        words.add(numAsString);
      }
    }
    return _convertWordsArrayIntoStringThatHasFormattedSpaces(words);
  }
}

List<int> _splitNumbers(int number) {
  List<int> numSplit = [];
  String numToStr = number.toString();

  String lastThreeStr = numToStr.substring(numToStr.length - 3);
  int lastThree = int.parse(lastThreeStr); 
  numSplit.insert(0, lastThree);

  String firstPartStr = numToStr.substring(0, numToStr.length - 3);
  int firstThreeNums = int.parse(firstPartStr); 
  numSplit.insert(0, firstThreeNums);

  return numSplit;
}

String _getValue0to999AsString(int number) {
  List<String> words = [];
  if(number == 0) {
    return 'zero';
  }
  else if(1 <= number && number <= 9) {
    words.add(_getSingleDigitAsWordString(number));
  } else if(10 <= number && number <= 99) {
    words.add(_get10to99ValueAsString(number));
  } else {
    words.add(_get100to999ValueAsString(number));
  }
  return _convertWordsArrayIntoStringThatHasFormattedSpaces(words);
}

String _get100to999ValueAsString(int number) {
  int firstDigit = number ~/ 100;
  String res = _getSingleDigitAsWordString(firstDigit) + " hundred";
  number -= firstDigit * 100;
  if(number < 10) {
    String digitAsString = _getSingleDigitAsWordString(number);
    if(digitAsString != "zero") {
      res += " " + digitAsString;
    }
  } else {
    String num10to99AsString = _get10to99ValueAsString(number);
    res += " " + num10to99AsString;
  }
  return res;
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

String _get20to99ValueAsString(int number) {
  String res = "";
  int firstDigit = number ~/ 10;
  res += _get20to90TensValueAsString(firstDigit);
  if(number % 10 != 0) {
    res += ' ' + _getSingleDigitAsWordString(number % 10);
  }
  return res;
}

String _get20to90TensValueAsString(int firstDigit) {
  switch (firstDigit) {
    case 2:
      return 'twenty';
    case 3:
      return 'thirty';
    case 4:
      return 'forty';
    case 5:
      return 'fifty';
    case 6:
      return 'sixty';
    case 7:
      return 'seventy';
    case 8:
      return 'eighty';
    case 9:
      return 'ninety';
    default:
      throw ArgumentError('First digit must be between 2 and 9.');
  }
}

String _get10to99ValueAsString(int number) {
  switch (number) {
    case 10:
      return 'ten';
    case 11:
      return 'eleven';
    case 12:
      return 'twelve';
    case 13:
      return 'thirteen';
    case 14:
      return 'fourteen';
    case 15:
      return 'fifteen';
    case 16:
      return 'sixteen';
    case 17:
      return 'seventeen';
    case 18:
      return 'eighteen';
    case 19:
      return 'nineteen';
    default:
      return _get20to99ValueAsString(number);
  }
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