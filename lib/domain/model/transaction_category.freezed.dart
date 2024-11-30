// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionCategory _$TransactionCategoryFromJson(Map<String, dynamic> json) {
  return _TransactionCategory.fromJson(json);
}

/// @nodoc
mixin _$TransactionCategory {
  int get categoryId => throw _privateConstructorUsedError; // 고유 ID
  String get categoryName =>
      throw _privateConstructorUsedError; // 유형 이름 (예: Salary, Rent 등)
  String get iconKey => throw _privateConstructorUsedError;
  AssetType get assetType => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCategoryCopyWith<TransactionCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCategoryCopyWith<$Res> {
  factory $TransactionCategoryCopyWith(
          TransactionCategory value, $Res Function(TransactionCategory) then) =
      _$TransactionCategoryCopyWithImpl<$Res, TransactionCategory>;
  @useResult
  $Res call(
      {int categoryId,
      String categoryName,
      String iconKey,
      AssetType assetType,
      int level,
      int userId});
}

/// @nodoc
class _$TransactionCategoryCopyWithImpl<$Res, $Val extends TransactionCategory>
    implements $TransactionCategoryCopyWith<$Res> {
  _$TransactionCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? iconKey = null,
    Object? assetType = null,
    Object? level = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      iconKey: null == iconKey
          ? _value.iconKey
          : iconKey // ignore: cast_nullable_to_non_nullable
              as String,
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionCategoryImplCopyWith<$Res>
    implements $TransactionCategoryCopyWith<$Res> {
  factory _$$TransactionCategoryImplCopyWith(_$TransactionCategoryImpl value,
          $Res Function(_$TransactionCategoryImpl) then) =
      __$$TransactionCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int categoryId,
      String categoryName,
      String iconKey,
      AssetType assetType,
      int level,
      int userId});
}

/// @nodoc
class __$$TransactionCategoryImplCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res, _$TransactionCategoryImpl>
    implements _$$TransactionCategoryImplCopyWith<$Res> {
  __$$TransactionCategoryImplCopyWithImpl(_$TransactionCategoryImpl _value,
      $Res Function(_$TransactionCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? iconKey = null,
    Object? assetType = null,
    Object? level = null,
    Object? userId = null,
  }) {
    return _then(_$TransactionCategoryImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      iconKey: null == iconKey
          ? _value.iconKey
          : iconKey // ignore: cast_nullable_to_non_nullable
              as String,
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
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
class _$TransactionCategoryImpl implements _TransactionCategory {
  const _$TransactionCategoryImpl(
      {required this.categoryId,
      required this.categoryName,
      required this.iconKey,
      required this.assetType,
      required this.level,
      required this.userId});

  factory _$TransactionCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionCategoryImplFromJson(json);

  @override
  final int categoryId;
// 고유 ID
  @override
  final String categoryName;
// 유형 이름 (예: Salary, Rent 등)
  @override
  final String iconKey;
  @override
  final AssetType assetType;
  @override
  final int level;
  @override
  final int userId;

  @override
  String toString() {
    return 'TransactionCategory(categoryId: $categoryId, categoryName: $categoryName, iconKey: $iconKey, assetType: $assetType, level: $level, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.iconKey, iconKey) || other.iconKey == iconKey) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, categoryName, iconKey, assetType, level, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCategoryImplCopyWith<_$TransactionCategoryImpl> get copyWith =>
      __$$TransactionCategoryImplCopyWithImpl<_$TransactionCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionCategoryImplToJson(
      this,
    );
  }
}

abstract class _TransactionCategory implements TransactionCategory {
  const factory _TransactionCategory(
      {required final int categoryId,
      required final String categoryName,
      required final String iconKey,
      required final AssetType assetType,
      required final int level,
      required final int userId}) = _$TransactionCategoryImpl;

  factory _TransactionCategory.fromJson(Map<String, dynamic> json) =
      _$TransactionCategoryImpl.fromJson;

  @override
  int get categoryId;
  @override // 고유 ID
  String get categoryName;
  @override // 유형 이름 (예: Salary, Rent 등)
  String get iconKey;
  @override
  AssetType get assetType;
  @override
  int get level;
  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$TransactionCategoryImplCopyWith<_$TransactionCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
