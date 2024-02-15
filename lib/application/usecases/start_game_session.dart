import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/domain/types/const_data.dart';
import 'package:memopize/infrastructure/assets/const_value_loader.dart';
import 'package:memopize/infrastructure/sqlite/const_data_db_helper.dart';

/// [StartGameSessionUseCase]はassetsから定数を読み込む処理のフロー
class StartGameSessionUseCase {
  StartGameSessionUseCase({
    required this.sGameSessionNotifier,
    required this.constName,
  });
  final SGameSessionNotifier sGameSessionNotifier;
  final String constName;

  Future<void> call() async {
    await _loadConstValue();
  }

  Future<void> _loadConstValue() async {
    final ConstValueLoader loader = ConstValueLoader();
    final String data = await loader.getInitValue(constName);
    final ConstData constData =
        await ConstValueDBHelper.getConstData(constName);
    final newSGameSession = sGameSessionNotifier.value.copyWith(
        constName: constName, constValue: data, highscore: constData.highscore);
    sGameSessionNotifier.set(
      newSGameSession,
    );
  }
}
