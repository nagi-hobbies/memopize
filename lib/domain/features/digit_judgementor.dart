class DigitJudgementor {
  bool judge(String inputStr, int openDigitsNum, String constData) {
    return inputStr == constData.split('.')[1][openDigitsNum];
  }
}
