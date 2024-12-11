// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionDetail _$TransactionDetailFromJson(Map<String, dynamic> json) {
  return _TransactionDetail.fromJson(json);
}

/// @nodoc
mixin _$TransactionDetail {
  int get transactionId => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  int get subCategoryId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;
  TransactionCategory get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDetailCopyWith<TransactionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailCopyWith<$Res> {
  factory $TransactionDetailCopyWith(
          TransactionDetail value, $Res Function(TransactionDetail) then) =
      _$TransactionDetailCopyWithImpl<$Res, TransactionDetail>;
  @useResult
  $Res call(
      {int transactionId,
      String memo,
      double amount,
      DateTime createdAt,
      DateTime updatedAt,
      String imgUrl,
      int categoryId,
      int subCategoryId,
      int userId,
      int assetId,
      TransactionCategory category});

  $TransactionCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$TransactionDetailCopyWithImpl<$Res, $Val extends TransactionDetail>
    implements $TransactionDetailCopyWith<$Res> {
  _$TransactionDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? memo = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? imgUrl = null,
    Object? categoryId = null,
    Object? subCategoryId = null,
    Object? userId = null,
    Object? assetId = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      subCategoryId: null == subCategoryId
          ? _value.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCategoryCopyWith<$Res> get category {
    return $TransactionCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionDetailImplCopyWith<$Res>
    implements $TransactionDetailCopyWith<$Res> {
  factory _$$TransactionDetailImplCopyWith(_$TransactionDetailImpl value,
          $Res Function(_$TransactionDetailImpl) then) =
      __$$TransactionDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int transactionId,
      String memo,
      double amount,
      DateTime createdAt,
      DateTime updatedAt,
      String imgUrl,
      int categoryId,
      int subCategoryId,
      int userId,
      int assetId,
      TransactionCategory category});

  @override
  $TransactionCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$TransactionDetailImplCopyWithImpl<$Res>
    extends _$TransactionDetailCopyWithImpl<$Res, _$TransactionDetailImpl>
    implements _$$TransactionDetailImplCopyWith<$Res> {
  __$$TransactionDetailImplCopyWithImpl(_$TransactionDetailImpl _value,
      $Res Function(_$TransactionDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? memo = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? imgUrl = null,
    Object? categoryId = null,
    Object? subCategoryId = null,
    Object? userId = null,
    Object? assetId = null,
    Object? category = null,
  }) {
    return _then(_$TransactionDetailImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      subCategoryId: null == subCategoryId
          ? _value.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionDetailImpl implements _TransactionDetail {
  const _$TransactionDetailImpl(
      {required this.transactionId,
      required this.memo,
      required this.amount,
      required this.createdAt,
      required this.updatedAt,
      required this.imgUrl,
      required this.categoryId,
      required this.subCategoryId,
      required this.userId,
      required this.assetId,
      required this.category});

  factory _$TransactionDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionDetailImplFromJson(json);

  @override
  final int transactionId;
  @override
  final String memo;
  @override
  final double amount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String imgUrl;
  @override
  final int categoryId;
  @override
  final int subCategoryId;
  @override
  final int userId;
  @override
  final int assetId;
  @override
  final TransactionCategory category;

  @override
  String toString() {
    return 'TransactionDetail(transactionId: $transactionId, memo: $memo, amount: $amount, createdAt: $createdAt, updatedAt: $updatedAt, imgUrl: $imgUrl, categoryId: $categoryId, subCategoryId: $subCategoryId, userId: $userId, assetId: $assetId, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDetailImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.subCategoryId, subCategoryId) ||
                other.subCategoryId == subCategoryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      memo,
      amount,
      createdAt,
      updatedAt,
      imgUrl,
      categoryId,
      subCategoryId,
      userId,
      assetId,
      category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionDetailImplCopyWith<_$TransactionDetailImpl> get copyWith =>
      __$$TransactionDetailImplCopyWithImpl<_$TransactionDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionDetailImplToJson(
      this,
    );
  }
}

abstract class _TransactionDetail implements TransactionDetail {
  const factory _TransactionDetail(
      {required final int transactionId,
      required final String memo,
      required final double amount,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String imgUrl,
      required final int categoryId,
      required final int subCategoryId,
      required final int userId,
      required final int assetId,
      required final TransactionCategory category}) = _$TransactionDetailImpl;

  factory _TransactionDetail.fromJson(Map<String, dynamic> json) =
      _$TransactionDetailImpl.fromJson;

  @override
  int get transactionId;
  @override
  String get memo;
  @override
  double get amount;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get imgUrl;
  @override
  int get categoryId;
  @override
  int get subCategoryId;
  @override
  int get userId;
  @override
  int get assetId;
  @override
  TransactionCategory get category;
  @override
  @JsonKey(ignore: true)
  _$$TransactionDetailImplCopyWith<_$TransactionDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
