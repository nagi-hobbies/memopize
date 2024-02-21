// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constants_json_helper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConstantsJsonHelperImpl _$$ConstantsJsonHelperImplFromJson(
        Map<String, dynamic> json) =>
    _$ConstantsJsonHelperImpl(
      constants: (json['constants'] as List<dynamic>)
          .map((e) =>
              InnerConstantsJsonHelper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ConstantsJsonHelperImplToJson(
        _$ConstantsJsonHelperImpl instance) =>
    <String, dynamic>{
      'constants': instance.constants,
    };

_$innerConstantsJsonHelperImpl _$$innerConstantsJsonHelperImplFromJson(
        Map<String, dynamic> json) =>
    _$innerConstantsJsonHelperImpl(
      category: json['category'] as String,
      tex: json['tex'] as String,
      firstthree: json['firstthree'] as String,
      value: json['value'] as String,
      nameJa: json['nameJa'] as String,
      nameEn: json['nameEn'] as String,
      descriptionJa: json['descriptionJa'] as String,
      descriptionEn: json['descriptionEn'] as String,
    );

Map<String, dynamic> _$$innerConstantsJsonHelperImplToJson(
        _$innerConstantsJsonHelperImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'tex': instance.tex,
      'firstthree': instance.firstthree,
      'value': instance.value,
      'nameJa': instance.nameJa,
      'nameEn': instance.nameEn,
      'descriptionJa': instance.descriptionJa,
      'descriptionEn': instance.descriptionEn,
    };
