class DigitJudgementor {
  bool judge(String inputStr, int openDigitsNum, String constData) {
    if (openDigitsNum == 0) {
      return constData[0] == inputStr;
    }
    return inputStr == constData[1 + openDigitsNum];
  }
}
