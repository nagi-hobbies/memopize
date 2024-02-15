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
  String get constName => throw _privateConstructorUsedError;
  String get constValue => throw _privateConstructorUsedError;
  int get highscore => throw _privateConstructorUsedError; // ゲーム開始時時点でのハイスコア
  int get rowLength => throw _privateConstructorUsedError;
  double get digitFontSize => throw _privateConstructorUsedError;

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
      {String constName,
      String constValue,
      int highscore,
      int rowLength,
      double digitFontSize});
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
    Object? constName = null,
    Object? constValue = null,
    Object? highscore = null,
    Object? rowLength = null,
    Object? digitFontSize = null,
  }) {
    return _then(_value.copyWith(
      constName: null == constName
          ? _value.constName
          : constName // ignore: cast_nullable_to_non_nullable
              as String,
      constValue: null == constValue
          ? _value.constValue
          : constValue // ignore: cast_nullable_to_non_nullable
              as String,
      highscore: null == highscore
          ? _value.highscore
          : highscore // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$GameSessionImplCopyWith<$Res>
    implements $GameSessionCopyWith<$Res> {
  factory _$$GameSessionImplCopyWith(
          _$GameSessionImpl value, $Res Function(_$GameSessionImpl) then) =
      __$$GameSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String constName,
      String constValue,
      int highscore,
      int rowLength,
      double digitFontSize});
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
    Object? constName = null,
    Object? constValue = null,
    Object? highscore = null,
    Object? rowLength = null,
    Object? digitFontSize = null,
  }) {
    return _then(_$GameSessionImpl(
      constName: null == constName
          ? _value.constName
          : constName // ignore: cast_nullable_to_non_nullable
              as String,
      constValue: null == constValue
          ? _value.constValue
          : constValue // ignore: cast_nullable_to_non_nullable
              as String,
      highscore: null == highscore
          ? _value.highscore
          : highscore // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$GameSessionImpl implements _GameSession {
  const _$GameSessionImpl(
      {required this.constName,
      required this.constValue,
      required this.highscore,
      required this.rowLength,
      required this.digitFontSize});

  @override
  final String constName;
  @override
  final String constValue;
  @override
  final int highscore;
// ゲーム開始時時点でのハイスコア
  @override
  final int rowLength;
  @override
  final double digitFontSize;

  @override
  String toString() {
    return 'GameSession(constName: $constName, constValue: $constValue, highscore: $highscore, rowLength: $rowLength, digitFontSize: $digitFontSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSessionImpl &&
            (identical(other.constName, constName) ||
                other.constName == constName) &&
            (identical(other.constValue, constValue) ||
                other.constValue == constValue) &&
            (identical(other.highscore, highscore) ||
                other.highscore == highscore) &&
            (identical(other.rowLength, rowLength) ||
                other.rowLength == rowLength) &&
            (identical(other.digitFontSize, digitFontSize) ||
                other.digitFontSize == digitFontSize));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, constName, constValue, highscore, rowLength, digitFontSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSessionImplCopyWith<_$GameSessionImpl> get copyWith =>
      __$$GameSessionImplCopyWithImpl<_$GameSessionImpl>(this, _$identity);
}

abstract class _GameSession implements GameSession {
  const factory _GameSession(
      {required final String constName,
      required final String constValue,
      required final int highscore,
      required final int rowLength,
      required final double digitFontSize}) = _$GameSessionImpl;

  @override
  String get constName;
  @override
  String get constValue;
  @override
  int get highscore;
  @override // ゲーム開始時時点でのハイスコア
  int get rowLength;
  @override
  double get digitFontSize;
  @override
  @JsonKey(ignore: true)
  _$$GameSessionImplCopyWith<_$GameSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
