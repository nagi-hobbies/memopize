import 'package:freezed_annotation/freezed_annotation.dart';

part 'constants_json_helper.freezed.dart';
part 'constants_json_helper.g.dart';

@freezed
class ConstantsJsonHelper with _$ConstantsJsonHelper {
  const factory ConstantsJsonHelper({
    required List<InnerConstantsJsonHelper> constants,
  }) = _ConstantsJsonHelper;

  factory ConstantsJsonHelper.fromJson(Map<String, dynamic> json) =>
      _$ConstantsJsonHelperFromJson(json);
}

@freezed
class InnerConstantsJsonHelper with _$InnerConstantsJsonHelper {
  const factory InnerConstantsJsonHelper({
    required String category,
    required String tex,
    required String firstthree,
    required String value,
    required String nameJa,
    required String nameEn,
    required String descriptionJa,
    required String descriptionEn,
  }) = _innerConstantsJsonHelper;

  factory InnerConstantsJsonHelper.fromJson(Map<String, dynamic> json) =>
      _$InnerConstantsJsonHelperFromJson(json);
}
