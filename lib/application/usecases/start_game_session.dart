import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/infrastructure/sqlite/const_data_db_helper.dart';

/// [StartGameSessionUseCase]はassetsから定数を読み込む処理のフロー
class StartGameSessionUseCase {
  StartGameSessionUseCase({
    required this.sGameSessionNotifier,
    required this.sDisplayConstDataListNotifier,
    required this.constId,
  });
  final SGameSessionNotifier sGameSessionNotifier;
  final SDisplayConstDataListNotifier sDisplayConstDataListNotifier;
  final int constId;

  Future<void> call() async {
    await _loadConstValue();
  }

  Future<void> _loadConstValue() async {
    final value = await ConstValueDBHelper.getConstValue(constId);
    final newSGameSession = sGameSessionNotifier.value.copyWith(
      displayConstData: sDisplayConstDataListNotifier.value[constId],
      constValue: value,
    );
    sGameSessionNotifier.set(
      newSGameSession,
    );
  }
}
