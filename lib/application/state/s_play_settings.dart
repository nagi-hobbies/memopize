import 'package:memopize/domain/types/play_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_play_settings.g.dart';

@riverpod
class SPlaySettingsNotifier extends _$SPlaySettingsNotifier {
  @override
  PlaySettings build() {
    return const PlaySettings(rowLength: 4, digitFontSize: 20.0);
  }

  void setRowLength(int rowLength) {
    state = state.copyWith(rowLength: rowLength);
  }

  void setDigitFontSize(double digitFontSize) {
    state = state.copyWith(digitFontSize: digitFontSize);
  }
}
