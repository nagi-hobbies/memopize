class ConstDataLoader {
  String getInitData(String constName) {
    final String data = switch (constName) {
      'pi' => '''
        3.1415926535
        8979323846
        2643383279
        5028841971
        6939937510
        5820974944
        5923078164
        0628620899
        8628034825
        3421170679
        '''
          .replaceAll('\n', '')
          .replaceAll(' ', ''),
      'e' => '''
        2.7182818284
        5904523536
        0287471352
        6624977572
        4709369995
        9574966967
        6277240766
        3035354759
        4571382178
        5251664274
        '''
          .replaceAll('\n', '')
          .replaceAll(' ', ''),
      'sqrt2' => '''
        1.4142135623
        7309504880
        1688724209
        6980785696
        7187537694
        8073176679
        7379907324
        7846210703
        8850387534
        3276415727
        '''
          .replaceAll('\n', '')
          .replaceAll(' ', ''),
      // TODO: Handle this case.
      String() => '',
    };
    return data;
  }
}
