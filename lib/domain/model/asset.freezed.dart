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

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get title => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<User> get user => throw _privateConstructorUsedError;
  AssetType get assetType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String title,
      String imgUrl,
      DateTime createdAt,
      DateTime updatedAt,
      List<User> user,
      AssetType assetType});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? imgUrl = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? assetType = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as List<User>,
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$AssetImplCopyWith(
          _$AssetImpl value, $Res Function(_$AssetImpl) then) =
      __$$AssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String imgUrl,
      DateTime createdAt,
      DateTime updatedAt,
      List<User> user,
      AssetType assetType});
}

/// @nodoc
class __$$AssetImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$AssetImpl>
    implements _$$AssetImplCopyWith<$Res> {
  __$$AssetImplCopyWithImpl(
      _$AssetImpl _value, $Res Function(_$AssetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? imgUrl = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? assetType = null,
  }) {
    return _then(_$AssetImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as List<User>,
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl implements _Asset {
  const _$AssetImpl(
      {required this.title,
      required this.imgUrl,
      required this.createdAt,
      required this.updatedAt,
      required final List<User> user,
      required this.assetType})
      : _user = user;

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final String title;
  @override
  final String imgUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<User> _user;
  @override
  List<User> get user {
    if (_user is EqualUnmodifiableListView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_user);
  }

  @override
  final AssetType assetType;

  @override
  String toString() {
    return 'Transaction(title: $title, imgUrl: $imgUrl, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, assetType: $assetType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, imgUrl, createdAt,
      updatedAt, const DeepCollectionEquality().hash(_user), assetType);

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

abstract class _Asset implements Transaction {
  const factory _Asset(
      {required final String title,
      required final String imgUrl,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final List<User> user,
      required final AssetType assetType}) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  String get title;
  @override
  String get imgUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<User> get user;
  @override
  AssetType get assetType;
  @override
  @JsonKey(ignore: true)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
