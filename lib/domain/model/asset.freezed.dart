// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  String get assetId => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int get isActiveAsset => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get firstColor => throw _privateConstructorUsedError;
  int get secondColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call(
      {String assetId,
      String assetName,
      String currency,
      int isActiveAsset,
      DateTime createdAt,
      DateTime updatedAt,
      int firstColor,
      int secondColor});
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset>
    implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetId = null,
    Object? assetName = null,
    Object? currency = null,
    Object? isActiveAsset = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? firstColor = null,
    Object? secondColor = null,
  }) {
    return _then(_value.copyWith(
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      isActiveAsset: null == isActiveAsset
          ? _value.isActiveAsset
          : isActiveAsset // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firstColor: null == firstColor
          ? _value.firstColor
          : firstColor // ignore: cast_nullable_to_non_nullable
              as int,
      secondColor: null == secondColor
          ? _value.secondColor
          : secondColor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetImplCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$AssetImplCopyWith(
          _$AssetImpl value, $Res Function(_$AssetImpl) then) =
      __$$AssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String assetId,
      String assetName,
      String currency,
      int isActiveAsset,
      DateTime createdAt,
      DateTime updatedAt,
      int firstColor,
      int secondColor});
}

/// @nodoc
class __$$AssetImplCopyWithImpl<$Res>
    extends _$AssetCopyWithImpl<$Res, _$AssetImpl>
    implements _$$AssetImplCopyWith<$Res> {
  __$$AssetImplCopyWithImpl(
      _$AssetImpl _value, $Res Function(_$AssetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetId = null,
    Object? assetName = null,
    Object? currency = null,
    Object? isActiveAsset = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? firstColor = null,
    Object? secondColor = null,
  }) {
    return _then(_$AssetImpl(
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      isActiveAsset: null == isActiveAsset
          ? _value.isActiveAsset
          : isActiveAsset // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firstColor: null == firstColor
          ? _value.firstColor
          : firstColor // ignore: cast_nullable_to_non_nullable
              as int,
      secondColor: null == secondColor
          ? _value.secondColor
          : secondColor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl implements _Asset {
  const _$AssetImpl(
      {required this.assetId,
      required this.assetName,
      required this.currency,
      required this.isActiveAsset,
      required this.createdAt,
      required this.updatedAt,
      required this.firstColor,
      required this.secondColor});

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final String assetId;
  @override
  final String assetName;
  @override
  final String currency;
  @override
  final int isActiveAsset;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int firstColor;
  @override
  final int secondColor;

  @override
  String toString() {
    return 'Asset(assetId: $assetId, assetName: $assetName, currency: $currency, isActiveAsset: $isActiveAsset, createdAt: $createdAt, updatedAt: $updatedAt, firstColor: $firstColor, secondColor: $secondColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isActiveAsset, isActiveAsset) ||
                other.isActiveAsset == isActiveAsset) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.firstColor, firstColor) ||
                other.firstColor == firstColor) &&
            (identical(other.secondColor, secondColor) ||
                other.secondColor == secondColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, assetId, assetName, currency,
      isActiveAsset, createdAt, updatedAt, firstColor, secondColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      __$$AssetImplCopyWithImpl<_$AssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetImplToJson(
      this,
    );
  }
}

abstract class _Asset implements Asset {
  const factory _Asset(
      {required final String assetId,
      required final String assetName,
      required final String currency,
      required final int isActiveAsset,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final int firstColor,
      required final int secondColor}) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  String get assetId;
  @override
  String get assetName;
  @override
  String get currency;
  @override
  int get isActiveAsset;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get firstColor;
  @override
  int get secondColor;
  @override
  @JsonKey(ignore: true)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
