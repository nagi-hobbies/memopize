// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'constants_json_helper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConstantsJsonHelper _$ConstantsJsonHelperFromJson(Map<String, dynamic> json) {
  return _ConstantsJsonHelper.fromJson(json);
}

/// @nodoc
mixin _$ConstantsJsonHelper {
  List<InnerConstantsJsonHelper> get constants =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConstantsJsonHelperCopyWith<ConstantsJsonHelper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConstantsJsonHelperCopyWith<$Res> {
  factory $ConstantsJsonHelperCopyWith(
          ConstantsJsonHelper value, $Res Function(ConstantsJsonHelper) then) =
      _$ConstantsJsonHelperCopyWithImpl<$Res, ConstantsJsonHelper>;
  @useResult
  $Res call({List<InnerConstantsJsonHelper> constants});
}

/// @nodoc
class _$ConstantsJsonHelperCopyWithImpl<$Res, $Val extends ConstantsJsonHelper>
    implements $ConstantsJsonHelperCopyWith<$Res> {
  _$ConstantsJsonHelperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? constants = null,
  }) {
    return _then(_value.copyWith(
      constants: null == constants
          ? _value.constants
          : constants // ignore: cast_nullable_to_non_nullable
              as List<InnerConstantsJsonHelper>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConstantsJsonHelperImplCopyWith<$Res>
    implements $ConstantsJsonHelperCopyWith<$Res> {
  factory _$$ConstantsJsonHelperImplCopyWith(_$ConstantsJsonHelperImpl value,
          $Res Function(_$ConstantsJsonHelperImpl) then) =
      __$$ConstantsJsonHelperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<InnerConstantsJsonHelper> constants});
}

/// @nodoc
class __$$ConstantsJsonHelperImplCopyWithImpl<$Res>
    extends _$ConstantsJsonHelperCopyWithImpl<$Res, _$ConstantsJsonHelperImpl>
    implements _$$ConstantsJsonHelperImplCopyWith<$Res> {
  __$$ConstantsJsonHelperImplCopyWithImpl(_$ConstantsJsonHelperImpl _value,
      $Res Function(_$ConstantsJsonHelperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? constants = null,
  }) {
    return _then(_$ConstantsJsonHelperImpl(
      constants: null == constants
          ? _value._constants
          : constants // ignore: cast_nullable_to_non_nullable
              as List<InnerConstantsJsonHelper>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConstantsJsonHelperImpl implements _ConstantsJsonHelper {
  const _$ConstantsJsonHelperImpl(
      {required final List<InnerConstantsJsonHelper> constants})
      : _constants = constants;

  factory _$ConstantsJsonHelperImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConstantsJsonHelperImplFromJson(json);

  final List<InnerConstantsJsonHelper> _constants;
  @override
  List<InnerConstantsJsonHelper> get constants {
    if (_constants is EqualUnmodifiableListView) return _constants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_constants);
  }

  @override
  String toString() {
    return 'ConstantsJsonHelper(constants: $constants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConstantsJsonHelperImpl &&
            const DeepCollectionEquality()
                .equals(other._constants, _constants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_constants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConstantsJsonHelperImplCopyWith<_$ConstantsJsonHelperImpl> get copyWith =>
      __$$ConstantsJsonHelperImplCopyWithImpl<_$ConstantsJsonHelperImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConstantsJsonHelperImplToJson(
      this,
    );
  }
}

abstract class _ConstantsJsonHelper implements ConstantsJsonHelper {
  const factory _ConstantsJsonHelper(
          {required final List<InnerConstantsJsonHelper> constants}) =
      _$ConstantsJsonHelperImpl;

  factory _ConstantsJsonHelper.fromJson(Map<String, dynamic> json) =
      _$ConstantsJsonHelperImpl.fromJson;

  @override
  List<InnerConstantsJsonHelper> get constants;
  @override
  @JsonKey(ignore: true)
  _$$ConstantsJsonHelperImplCopyWith<_$ConstantsJsonHelperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InnerConstantsJsonHelper _$InnerConstantsJsonHelperFromJson(
    Map<String, dynamic> json) {
  return _innerConstantsJsonHelper.fromJson(json);
}

/// @nodoc
mixin _$InnerConstantsJsonHelper {
  int get id => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get tex => throw _privateConstructorUsedError;
  String get firstthree => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get nameJa => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  String get descriptionJa => throw _privateConstructorUsedError;
  String get descriptionEn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InnerConstantsJsonHelperCopyWith<InnerConstantsJsonHelper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InnerConstantsJsonHelperCopyWith<$Res> {
  factory $InnerConstantsJsonHelperCopyWith(InnerConstantsJsonHelper value,
          $Res Function(InnerConstantsJsonHelper) then) =
      _$InnerConstantsJsonHelperCopyWithImpl<$Res, InnerConstantsJsonHelper>;
  @useResult
  $Res call(
      {int id,
      String category,
      String tex,
      String firstthree,
      String value,
      String nameJa,
      String nameEn,
      String descriptionJa,
      String descriptionEn});
}

/// @nodoc
class _$InnerConstantsJsonHelperCopyWithImpl<$Res,
        $Val extends InnerConstantsJsonHelper>
    implements $InnerConstantsJsonHelperCopyWith<$Res> {
  _$InnerConstantsJsonHelperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? tex = null,
    Object? firstthree = null,
    Object? value = null,
    Object? nameJa = null,
    Object? nameEn = null,
    Object? descriptionJa = null,
    Object? descriptionEn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tex: null == tex
          ? _value.tex
          : tex // ignore: cast_nullable_to_non_nullable
              as String,
      firstthree: null == firstthree
          ? _value.firstthree
          : firstthree // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      nameJa: null == nameJa
          ? _value.nameJa
          : nameJa // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionJa: null == descriptionJa
          ? _value.descriptionJa
          : descriptionJa // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionEn: null == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$innerConstantsJsonHelperImplCopyWith<$Res>
    implements $InnerConstantsJsonHelperCopyWith<$Res> {
  factory _$$innerConstantsJsonHelperImplCopyWith(
          _$innerConstantsJsonHelperImpl value,
          $Res Function(_$innerConstantsJsonHelperImpl) then) =
      __$$innerConstantsJsonHelperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String category,
      String tex,
      String firstthree,
      String value,
      String nameJa,
      String nameEn,
      String descriptionJa,
      String descriptionEn});
}

/// @nodoc
class __$$innerConstantsJsonHelperImplCopyWithImpl<$Res>
    extends _$InnerConstantsJsonHelperCopyWithImpl<$Res,
        _$innerConstantsJsonHelperImpl>
    implements _$$innerConstantsJsonHelperImplCopyWith<$Res> {
  __$$innerConstantsJsonHelperImplCopyWithImpl(
      _$innerConstantsJsonHelperImpl _value,
      $Res Function(_$innerConstantsJsonHelperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? tex = null,
    Object? firstthree = null,
    Object? value = null,
    Object? nameJa = null,
    Object? nameEn = null,
    Object? descriptionJa = null,
    Object? descriptionEn = null,
  }) {
    return _then(_$innerConstantsJsonHelperImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tex: null == tex
          ? _value.tex
          : tex // ignore: cast_nullable_to_non_nullable
              as String,
      firstthree: null == firstthree
          ? _value.firstthree
          : firstthree // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      nameJa: null == nameJa
          ? _value.nameJa
          : nameJa // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionJa: null == descriptionJa
          ? _value.descriptionJa
          : descriptionJa // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionEn: null == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$innerConstantsJsonHelperImpl implements _innerConstantsJsonHelper {
  const _$innerConstantsJsonHelperImpl(
      {required this.id,
      required this.category,
      required this.tex,
      required this.firstthree,
      required this.value,
      required this.nameJa,
      required this.nameEn,
      required this.descriptionJa,
      required this.descriptionEn});

  factory _$innerConstantsJsonHelperImpl.fromJson(Map<String, dynamic> json) =>
      _$$innerConstantsJsonHelperImplFromJson(json);

  @override
  final int id;
  @override
  final String category;
  @override
  final String tex;
  @override
  final String firstthree;
  @override
  final String value;
  @override
  final String nameJa;
  @override
  final String nameEn;
  @override
  final String descriptionJa;
  @override
  final String descriptionEn;

  @override
  String toString() {
    return 'InnerConstantsJsonHelper(id: $id, category: $category, tex: $tex, firstthree: $firstthree, value: $value, nameJa: $nameJa, nameEn: $nameEn, descriptionJa: $descriptionJa, descriptionEn: $descriptionEn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$innerConstantsJsonHelperImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.tex, tex) || other.tex == tex) &&
            (identical(other.firstthree, firstthree) ||
                other.firstthree == firstthree) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.nameJa, nameJa) || other.nameJa == nameJa) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.descriptionJa, descriptionJa) ||
                other.descriptionJa == descriptionJa) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, category, tex, firstthree,
      value, nameJa, nameEn, descriptionJa, descriptionEn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$innerConstantsJsonHelperImplCopyWith<_$innerConstantsJsonHelperImpl>
      get copyWith => __$$innerConstantsJsonHelperImplCopyWithImpl<
          _$innerConstantsJsonHelperImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$innerConstantsJsonHelperImplToJson(
      this,
    );
  }
}

abstract class _innerConstantsJsonHelper implements InnerConstantsJsonHelper {
  const factory _innerConstantsJsonHelper(
      {required final int id,
      required final String category,
      required final String tex,
      required final String firstthree,
      required final String value,
      required final String nameJa,
      required final String nameEn,
      required final String descriptionJa,
      required final String descriptionEn}) = _$innerConstantsJsonHelperImpl;

  factory _innerConstantsJsonHelper.fromJson(Map<String, dynamic> json) =
      _$innerConstantsJsonHelperImpl.fromJson;

  @override
  int get id;
  @override
  String get category;
  @override
  String get tex;
  @override
  String get firstthree;
  @override
  String get value;
  @override
  String get nameJa;
  @override
  String get nameEn;
  @override
  String get descriptionJa;
  @override
  String get descriptionEn;
  @override
  @JsonKey(ignore: true)
  _$$innerConstantsJsonHelperImplCopyWith<_$innerConstantsJsonHelperImpl>
      get copyWith => throw _privateConstructorUsedError;
}
