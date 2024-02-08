// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaySettings {
  int get rowLength => throw _privateConstructorUsedError;
  double get digitFontSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaySettingsCopyWith<PlaySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaySettingsCopyWith<$Res> {
  factory $PlaySettingsCopyWith(
          PlaySettings value, $Res Function(PlaySettings) then) =
      _$PlaySettingsCopyWithImpl<$Res, PlaySettings>;
  @useResult
  $Res call({int rowLength, double digitFontSize});
}

/// @nodoc
class _$PlaySettingsCopyWithImpl<$Res, $Val extends PlaySettings>
    implements $PlaySettingsCopyWith<$Res> {
  _$PlaySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowLength = null,
    Object? digitFontSize = null,
  }) {
    return _then(_value.copyWith(
      rowLength: null == rowLength
          ? _value.rowLength
          : rowLength // ignore: cast_nullable_to_non_nullable
              as int,
      digitFontSize: null == digitFontSize
          ? _value.digitFontSize
          : digitFontSize // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaySettingsImplCopyWith<$Res>
    implements $PlaySettingsCopyWith<$Res> {
  factory _$$PlaySettingsImplCopyWith(
          _$PlaySettingsImpl value, $Res Function(_$PlaySettingsImpl) then) =
      __$$PlaySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rowLength, double digitFontSize});
}

/// @nodoc
class __$$PlaySettingsImplCopyWithImpl<$Res>
    extends _$PlaySettingsCopyWithImpl<$Res, _$PlaySettingsImpl>
    implements _$$PlaySettingsImplCopyWith<$Res> {
  __$$PlaySettingsImplCopyWithImpl(
      _$PlaySettingsImpl _value, $Res Function(_$PlaySettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowLength = null,
    Object? digitFontSize = null,
  }) {
    return _then(_$PlaySettingsImpl(
      rowLength: null == rowLength
          ? _value.rowLength
          : rowLength // ignore: cast_nullable_to_non_nullable
              as int,
      digitFontSize: null == digitFontSize
          ? _value.digitFontSize
          : digitFontSize // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PlaySettingsImpl implements _PlaySettings {
  const _$PlaySettingsImpl(
      {required this.rowLength, required this.digitFontSize});

  @override
  final int rowLength;
  @override
  final double digitFontSize;

  @override
  String toString() {
    return 'PlaySettings(rowLength: $rowLength, digitFontSize: $digitFontSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaySettingsImpl &&
            (identical(other.rowLength, rowLength) ||
                other.rowLength == rowLength) &&
            (identical(other.digitFontSize, digitFontSize) ||
                other.digitFontSize == digitFontSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rowLength, digitFontSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaySettingsImplCopyWith<_$PlaySettingsImpl> get copyWith =>
      __$$PlaySettingsImplCopyWithImpl<_$PlaySettingsImpl>(this, _$identity);
}

abstract class _PlaySettings implements PlaySettings {
  const factory _PlaySettings(
      {required final int rowLength,
      required final double digitFontSize}) = _$PlaySettingsImpl;

  @override
  int get rowLength;
  @override
  double get digitFontSize;
  @override
  @JsonKey(ignore: true)
  _$$PlaySettingsImplCopyWith<_$PlaySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
