import 'package:memopize/domain/types/display_const_data.dart';
import 'package:memopize/domain/types/game_session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_game_session.g.dart';

@Riverpod(keepAlive: true)
class SGameSessionNotifier extends _$SGameSessionNotifier {
  @override
  GameSession build() {
    return const GameSession(
        displayConstData: DisplayConstData(
          id: 0,
          category: '',
          tex: '',
          firstthree: '',
          name: '',
          description: '',
          highscore: 0,
        ),
        constValue: '',
        rowLength: 10,
        revertCount: 10);
  }

  GameSession get value => state;

  void set(GameSession gameSession) {
    state = gameSession;
  }
}
