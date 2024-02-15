import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/infrastructure/sqlite/const_data_db_helper.dart';

class ExitGamePageUseCase {
  ExitGamePageUseCase({
    required this.sGameSessionNotifier,
    required this.sScoreNotifier,
  });

  final SGameSessionNotifier sGameSessionNotifier;
  final SScoreNotifier sScoreNotifier;

  Future<void> call() async {
    final int constId = sGameSessionNotifier.value.displayConstData.id;
    final int highscore = sGameSessionNotifier.value.displayConstData.highscore;
    final int score = sScoreNotifier.value; // 今回のゲームのスコア

    if (score > highscore) {
      await ConstValueDBHelper.updateHighscore(constId, score);
    }
  }
}
