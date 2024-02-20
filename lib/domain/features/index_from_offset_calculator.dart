class IndexFromOffsetCulculator {
  static int calculateIndexFromOffset(
      double offset, int itemNum, double itemEtent, double windowWidth) {
    final double offsetMax = itemEtent * itemNum - windowWidth;
    return (offset + windowWidth * offset / offsetMax + itemEtent / 2) ~/
        itemEtent;
  }
}
