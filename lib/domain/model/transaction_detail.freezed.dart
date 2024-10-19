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
  String get transactionId => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  List<String> get email => throw _privateConstructorUsedError;
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
      {String transactionId,
      String memo,
      DateTime? createdAt,
      DateTime? updatedAt,
      double amount,
      List<String> email,
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
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? amount = null,
    Object? email = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      {String transactionId,
      String memo,
      DateTime? createdAt,
      DateTime? updatedAt,
      double amount,
      List<String> email,
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
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? amount = null,
    Object? email = null,
    Object? category = null,
  }) {
    return _then(_$TransactionDetailImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      email: null == email
          ? _value._email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      this.createdAt,
      this.updatedAt,
      required this.amount,
      required final List<String> email,
      required this.category})
      : _email = email;

  factory _$TransactionDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionDetailImplFromJson(json);

  @override
  final String transactionId;
  @override
  final String memo;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final double amount;
  final List<String> _email;
  @override
  List<String> get email {
    if (_email is EqualUnmodifiableListView) return _email;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_email);
  }

  @override
  final TransactionCategory category;

  @override
  String toString() {
    return 'TransactionDetail(transactionId: $transactionId, memo: $memo, createdAt: $createdAt, updatedAt: $updatedAt, amount: $amount, email: $email, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDetailImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(other._email, _email) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionId, memo, createdAt,
      updatedAt, amount, const DeepCollectionEquality().hash(_email), category);

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
      {required final String transactionId,
      required final String memo,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      required final double amount,
      required final List<String> email,
      required final TransactionCategory category}) = _$TransactionDetailImpl;

  factory _TransactionDetail.fromJson(Map<String, dynamic> json) =
      _$TransactionDetailImpl.fromJson;

  @override
  String get transactionId;
  @override
  String get memo;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  double get amount;
  @override
  List<String> get email;
  @override
  TransactionCategory get category;
  @override
  @JsonKey(ignore: true)
  _$$TransactionDetailImplCopyWith<_$TransactionDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
