import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memopize/domain/types/display_const_data.dart';

part 'game_session.freezed.dart';

/// [GameSession]は、ゲームのセッション情報を保持する
/// 基本的にはゲームページ内で変更されない値を保持する
@freezed
class GameSession with _$GameSession {
  const factory GameSession({
    required DisplayConstData displayConstData,
    required String constValue,
    required int rowLength,
    required bool wheatherRevert,
  }) = _GameSession;
}
