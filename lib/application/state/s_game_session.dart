import 'package:memopize/domain/types/game_session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_game_session.g.dart';

@Riverpod(keepAlive: true)
class SGameSessionNotifier extends _$SGameSessionNotifier {
  @override
  GameSession build() {
    return const GameSession(
        constName: '',
        constValue: '',
        highscore: 0,
        rowLength: 10,
        digitFontSize: 40.0);
  }

  GameSession get value => state;

  void set(GameSession gameSession) {
    state = gameSession;
  }
}
