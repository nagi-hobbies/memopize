import 'package:memopize/infrastructure/sqlite/const_data_db_helper.dart';

class ExitGamePageUseCase {
  ExitGamePageUseCase();
  Future<void> call(String constPath, int highscore) async {
    final data = await ConstValueDBHelper.getConstData(constPath);
    if (data.highscore < highscore) {
      await ConstValueDBHelper.updateHighscore(constPath, highscore);
    }
  }
}
