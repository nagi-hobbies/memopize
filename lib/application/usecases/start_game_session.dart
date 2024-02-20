import 'dart:math';

import 'package:memopize/application/state/memorize_page/s_animated_list_model.dart';
import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/infrastructure/sqlite/const_data_db_helper.dart';

/// [StartGameSessionUseCase]はassetsから定数を読み込む処理のフロー
class StartGameSessionUseCase {
  StartGameSessionUseCase({
    required this.sGameSessionNotifier,
    required this.sDisplayConstDataListNotifier,
    required this.animatedListModelNotifier,
    required this.constId,
  });
  final SGameSessionNotifier sGameSessionNotifier;
  final SDisplayConstDataListNotifier sDisplayConstDataListNotifier;
  final SAnimatedListModelNotifier animatedListModelNotifier;
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
    animatedListModelNotifier.set(
      List<int>.generate(
        min(sGameSessionNotifier.value.constValue.length ~/ 10, 4),
        (index) => index,
      ),
    );
  }
}
