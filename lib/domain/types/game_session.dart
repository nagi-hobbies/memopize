import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_session.freezed.dart';

/// [GameSession]は、ゲームのセッション情報を保持する
/// 基本的にはゲームページ内で変更されない値を保持する
@freezed
class GameSession with _$GameSession {
  const factory GameSession({
    required String constName,
    required String constValue,
    required int highscore, // ゲーム開始時時点でのハイスコア
    required int rowLength,
    required double digitFontSize,
  }) = _GameSession;
}
