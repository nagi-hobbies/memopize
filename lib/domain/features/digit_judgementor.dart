class DigitJudgementor {
  bool judge(int inputDigit, int openDigitsNum) {
    if (inputDigit < openDigitsNum) {
      return true;
    }
    return false;
  }
}
