// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameSession {
  DisplayConstData get displayConstData => throw _privateConstructorUsedError;
  String get constValue => throw _privateConstructorUsedError;
  int get rowLength => throw _privateConstructorUsedError;
  bool get wheatherRevert => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameSessionCopyWith<GameSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSessionCopyWith<$Res> {
  factory $GameSessionCopyWith(
          GameSession value, $Res Function(GameSession) then) =
      _$GameSessionCopyWithImpl<$Res, GameSession>;
  @useResult
  $Res call(
      {DisplayConstData displayConstData,
      String constValue,
      int rowLength,
      bool wheatherRevert});

  $DisplayConstDataCopyWith<$Res> get displayConstData;
}

/// @nodoc
class _$GameSessionCopyWithImpl<$Res, $Val extends GameSession>
    implements $GameSessionCopyWith<$Res> {
  _$GameSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayConstData = null,
    Object? constValue = null,
    Object? rowLength = null,
    Object? wheatherRevert = null,
  }) {
    return _then(_value.copyWith(
      displayConstData: null == displayConstData
          ? _value.displayConstData
          : displayConstData // ignore: cast_nullable_to_non_nullable
              as DisplayConstData,
      constValue: null == constValue
          ? _value.constValue
          : constValue // ignore: cast_nullable_to_non_nullable
              as String,
      rowLength: null == rowLength
          ? _value.rowLength
          : rowLength // ignore: cast_nullable_to_non_nullable
              as int,
      wheatherRevert: null == wheatherRevert
          ? _value.wheatherRevert
          : wheatherRevert // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DisplayConstDataCopyWith<$Res> get displayConstData {
    return $DisplayConstDataCopyWith<$Res>(_value.displayConstData, (value) {
      return _then(_value.copyWith(displayConstData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameSessionImplCopyWith<$Res>
    implements $GameSessionCopyWith<$Res> {
  factory _$$GameSessionImplCopyWith(
          _$GameSessionImpl value, $Res Function(_$GameSessionImpl) then) =
      __$$GameSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DisplayConstData displayConstData,
      String constValue,
      int rowLength,
      bool wheatherRevert});

  @override
  $DisplayConstDataCopyWith<$Res> get displayConstData;
}

/// @nodoc
class __$$GameSessionImplCopyWithImpl<$Res>
    extends _$GameSessionCopyWithImpl<$Res, _$GameSessionImpl>
    implements _$$GameSessionImplCopyWith<$Res> {
  __$$GameSessionImplCopyWithImpl(
      _$GameSessionImpl _value, $Res Function(_$GameSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayConstData = null,
    Object? constValue = null,
    Object? rowLength = null,
    Object? wheatherRevert = null,
  }) {
    return _then(_$GameSessionImpl(
      displayConstData: null == displayConstData
          ? _value.displayConstData
          : displayConstData // ignore: cast_nullable_to_non_nullable
              as DisplayConstData,
      constValue: null == constValue
          ? _value.constValue
          : constValue // ignore: cast_nullable_to_non_nullable
              as String,
      rowLength: null == rowLength
          ? _value.rowLength
          : rowLength // ignore: cast_nullable_to_non_nullable
              as int,
      wheatherRevert: null == wheatherRevert
          ? _value.wheatherRevert
          : wheatherRevert // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GameSessionImpl implements _GameSession {
  const _$GameSessionImpl(
      {required this.displayConstData,
      required this.constValue,
      required this.rowLength,
      required this.wheatherRevert});

  @override
  final DisplayConstData displayConstData;
  @override
  final String constValue;
  @override
  final int rowLength;
  @override
  final bool wheatherRevert;

  @override
  String toString() {
    return 'GameSession(displayConstData: $displayConstData, constValue: $constValue, rowLength: $rowLength, wheatherRevert: $wheatherRevert)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSessionImpl &&
            (identical(other.displayConstData, displayConstData) ||
                other.displayConstData == displayConstData) &&
            (identical(other.constValue, constValue) ||
                other.constValue == constValue) &&
            (identical(other.rowLength, rowLength) ||
                other.rowLength == rowLength) &&
            (identical(other.wheatherRevert, wheatherRevert) ||
                other.wheatherRevert == wheatherRevert));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, displayConstData, constValue, rowLength, wheatherRevert);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSessionImplCopyWith<_$GameSessionImpl> get copyWith =>
      __$$GameSessionImplCopyWithImpl<_$GameSessionImpl>(this, _$identity);
}

abstract class _GameSession implements GameSession {
  const factory _GameSession(
      {required final DisplayConstData displayConstData,
      required final String constValue,
      required final int rowLength,
      required final bool wheatherRevert}) = _$GameSessionImpl;

  @override
  DisplayConstData get displayConstData;
  @override
  String get constValue;
  @override
  int get rowLength;
  @override
  bool get wheatherRevert;
  @override
  @JsonKey(ignore: true)
  _$$GameSessionImplCopyWith<_$GameSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
