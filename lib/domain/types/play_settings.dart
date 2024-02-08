import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_settings.freezed.dart';

@freezed
class PlaySettings with _$PlaySettings {
  const factory PlaySettings({
    required int rowLength,
    required double digitFontSize,
  }) = _PlaySettings;
}
