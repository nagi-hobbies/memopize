import 'package:freezed_annotation/freezed_annotation.dart';

part 'display_const_data.freezed.dart';

@freezed
class DisplayConstData with _$DisplayConstData {
  const factory DisplayConstData({
    required int id,
    required String category,
    required String tex,
    required String firstthree,
    required String name,
    required String description,
    required int highscore,
  }) = _DisplayConstData;
}
