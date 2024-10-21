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
  double get totalAmount => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;
  double get totalExpense => throw _privateConstructorUsedError;
  String get assetId => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  List<String> get userIdList => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get assetColor => throw _privateConstructorUsedError;

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
      {double totalAmount,
      double totalIncome,
      double totalExpense,
      String assetId,
      String assetName,
      String imgUrl,
      String currency,
      List<String> userIdList,
      DateTime createdAt,
      DateTime updatedAt,
      String? assetColor});
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
    Object? totalAmount = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? assetId = null,
    Object? assetName = null,
    Object? imgUrl = null,
    Object? currency = null,
    Object? userIdList = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assetColor = freezed,
  }) {
    return _then(_value.copyWith(
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      userIdList: null == userIdList
          ? _value.userIdList
          : userIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assetColor: freezed == assetColor
          ? _value.assetColor
          : assetColor // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {double totalAmount,
      double totalIncome,
      double totalExpense,
      String assetId,
      String assetName,
      String imgUrl,
      String currency,
      List<String> userIdList,
      DateTime createdAt,
      DateTime updatedAt,
      String? assetColor});
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
    Object? totalAmount = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? assetId = null,
    Object? assetName = null,
    Object? imgUrl = null,
    Object? currency = null,
    Object? userIdList = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assetColor = freezed,
  }) {
    return _then(_$AssetImpl(
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      userIdList: null == userIdList
          ? _value._userIdList
          : userIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assetColor: freezed == assetColor
          ? _value.assetColor
          : assetColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl implements _Asset {
  const _$AssetImpl(
      {required this.totalAmount,
      required this.totalIncome,
      required this.totalExpense,
      required this.assetId,
      required this.assetName,
      required this.imgUrl,
      required this.currency,
      required final List<String> userIdList,
      required this.createdAt,
      required this.updatedAt,
      this.assetColor})
      : _userIdList = userIdList;

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final double totalAmount;
  @override
  final double totalIncome;
  @override
  final double totalExpense;
  @override
  final String assetId;
  @override
  final String assetName;
  @override
  final String imgUrl;
  @override
  final String currency;
  final List<String> _userIdList;
  @override
  List<String> get userIdList {
    if (_userIdList is EqualUnmodifiableListView) return _userIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIdList);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? assetColor;

  @override
  String toString() {
    return 'Asset(totalAmount: $totalAmount, totalIncome: $totalIncome, totalExpense: $totalExpense, assetId: $assetId, assetName: $assetName, imgUrl: $imgUrl, currency: $currency, userIdList: $userIdList, createdAt: $createdAt, updatedAt: $updatedAt, assetColor: $assetColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._userIdList, _userIdList) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.assetColor, assetColor) ||
                other.assetColor == assetColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalAmount,
      totalIncome,
      totalExpense,
      assetId,
      assetName,
      imgUrl,
      currency,
      const DeepCollectionEquality().hash(_userIdList),
      createdAt,
      updatedAt,
      assetColor);

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
      {required final double totalAmount,
      required final double totalIncome,
      required final double totalExpense,
      required final String assetId,
      required final String assetName,
      required final String imgUrl,
      required final String currency,
      required final List<String> userIdList,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? assetColor}) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  double get totalAmount;
  @override
  double get totalIncome;
  @override
  double get totalExpense;
  @override
  String get assetId;
  @override
  String get assetName;
  @override
  String get imgUrl;
  @override
  String get currency;
  @override
  List<String> get userIdList;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get assetColor;
  @override
  @JsonKey(ignore: true)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
