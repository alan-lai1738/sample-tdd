
String integerToWordedString(int number) {
  List<String> words = [];

  if (number < 0) {
    words.add("negative");
    number = -number;
  }

  if (number == 1) {
    words.add("one");
  }

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