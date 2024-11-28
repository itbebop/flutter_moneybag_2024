// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_pallete.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPallete _$UserPalleteFromJson(Map<String, dynamic> json) {
  return _UserPallete.fromJson(json);
}

/// @nodoc
mixin _$UserPallete {
  int get colorId => throw _privateConstructorUsedError;
  String get hexaCode => throw _privateConstructorUsedError;
  int get colorOrder => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPalleteCopyWith<UserPallete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPalleteCopyWith<$Res> {
  factory $UserPalleteCopyWith(
          UserPallete value, $Res Function(UserPallete) then) =
      _$UserPalleteCopyWithImpl<$Res, UserPallete>;
  @useResult
  $Res call({int colorId, String hexaCode, int colorOrder, int userId});
}

/// @nodoc
class _$UserPalleteCopyWithImpl<$Res, $Val extends UserPallete>
    implements $UserPalleteCopyWith<$Res> {
  _$UserPalleteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorId = null,
    Object? hexaCode = null,
    Object? colorOrder = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      colorId: null == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int,
      hexaCode: null == hexaCode
          ? _value.hexaCode
          : hexaCode // ignore: cast_nullable_to_non_nullable
              as String,
      colorOrder: null == colorOrder
          ? _value.colorOrder
          : colorOrder // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPalleteImplCopyWith<$Res>
    implements $UserPalleteCopyWith<$Res> {
  factory _$$UserPalleteImplCopyWith(
          _$UserPalleteImpl value, $Res Function(_$UserPalleteImpl) then) =
      __$$UserPalleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int colorId, String hexaCode, int colorOrder, int userId});
}

/// @nodoc
class __$$UserPalleteImplCopyWithImpl<$Res>
    extends _$UserPalleteCopyWithImpl<$Res, _$UserPalleteImpl>
    implements _$$UserPalleteImplCopyWith<$Res> {
  __$$UserPalleteImplCopyWithImpl(
      _$UserPalleteImpl _value, $Res Function(_$UserPalleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorId = null,
    Object? hexaCode = null,
    Object? colorOrder = null,
    Object? userId = null,
  }) {
    return _then(_$UserPalleteImpl(
      colorId: null == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int,
      hexaCode: null == hexaCode
          ? _value.hexaCode
          : hexaCode // ignore: cast_nullable_to_non_nullable
              as String,
      colorOrder: null == colorOrder
          ? _value.colorOrder
          : colorOrder // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPalleteImpl implements _UserPallete {
  const _$UserPalleteImpl(
      {required this.colorId,
      required this.hexaCode,
      required this.colorOrder,
      required this.userId});

  factory _$UserPalleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPalleteImplFromJson(json);

  @override
  final int colorId;
  @override
  final String hexaCode;
  @override
  final int colorOrder;
  @override
  final int userId;

  @override
  String toString() {
    return 'UserPallete(colorId: $colorId, hexaCode: $hexaCode, colorOrder: $colorOrder, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPalleteImpl &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            (identical(other.hexaCode, hexaCode) ||
                other.hexaCode == hexaCode) &&
            (identical(other.colorOrder, colorOrder) ||
                other.colorOrder == colorOrder) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, colorId, hexaCode, colorOrder, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPalleteImplCopyWith<_$UserPalleteImpl> get copyWith =>
      __$$UserPalleteImplCopyWithImpl<_$UserPalleteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPalleteImplToJson(
      this,
    );
  }
}

abstract class _UserPallete implements UserPallete {
  const factory _UserPallete(
      {required final int colorId,
      required final String hexaCode,
      required final int colorOrder,
      required final int userId}) = _$UserPalleteImpl;

  factory _UserPallete.fromJson(Map<String, dynamic> json) =
      _$UserPalleteImpl.fromJson;

  @override
  int get colorId;
  @override
  String get hexaCode;
  @override
  int get colorOrder;
  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$UserPalleteImplCopyWith<_$UserPalleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
