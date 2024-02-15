import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/infrastructure/sqlite/const_data_db_helper.dart';

class ExitGamePageUseCase {
  ExitGamePageUseCase({
    required this.sGameSessionNotifier,
    required this.sScoreNotifier,
    required this.sDisplayConstDataListNotifier,
  });

  final SGameSessionNotifier sGameSessionNotifier;
  final SScoreNotifier sScoreNotifier;
  final SDisplayConstDataListNotifier sDisplayConstDataListNotifier;

  Future<void> call() async {
    final int constId = sGameSessionNotifier.value.displayConstData.id;
    final int highscore = sGameSessionNotifier.value.displayConstData.highscore;
    final int score = sScoreNotifier.value; // 今回のゲームのスコア

    if (score > highscore) {
      await ConstValueDBHelper.updateHighscore(constId, score);
      final newDisplayConstDataList = sDisplayConstDataListNotifier.value
          .map((e) => e.id == constId
              ? e.copyWith(
                  highscore: score,
                )
              : e)
          .toList();
      sDisplayConstDataListNotifier.set(newDisplayConstDataList);
    }
  }
}
