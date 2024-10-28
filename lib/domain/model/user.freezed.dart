// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  UserType get userType => throw _privateConstructorUsedError;
  List<String> get assetIdList => throw _privateConstructorUsedError;
  List<String> get firstColorListSave => throw _privateConstructorUsedError;
  List<String> get secondColorListSave => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String userId,
      String name,
      String email,
      String imgUrl,
      String language,
      UserType userType,
      List<String> assetIdList,
      List<String> firstColorListSave,
      List<String> secondColorListSave});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? email = null,
    Object? imgUrl = null,
    Object? language = null,
    Object? userType = null,
    Object? assetIdList = null,
    Object? firstColorListSave = null,
    Object? secondColorListSave = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      assetIdList: null == assetIdList
          ? _value.assetIdList
          : assetIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      firstColorListSave: null == firstColorListSave
          ? _value.firstColorListSave
          : firstColorListSave // ignore: cast_nullable_to_non_nullable
              as List<String>,
      secondColorListSave: null == secondColorListSave
          ? _value.secondColorListSave
          : secondColorListSave // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String name,
      String email,
      String imgUrl,
      String language,
      UserType userType,
      List<String> assetIdList,
      List<String> firstColorListSave,
      List<String> secondColorListSave});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? email = null,
    Object? imgUrl = null,
    Object? language = null,
    Object? userType = null,
    Object? assetIdList = null,
    Object? firstColorListSave = null,
    Object? secondColorListSave = null,
  }) {
    return _then(_$UserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      assetIdList: null == assetIdList
          ? _value._assetIdList
          : assetIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      firstColorListSave: null == firstColorListSave
          ? _value._firstColorListSave
          : firstColorListSave // ignore: cast_nullable_to_non_nullable
              as List<String>,
      secondColorListSave: null == secondColorListSave
          ? _value._secondColorListSave
          : secondColorListSave // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.userId,
      required this.name,
      required this.email,
      required this.imgUrl,
      required this.language,
      required this.userType,
      required final List<String> assetIdList,
      required final List<String> firstColorListSave,
      required final List<String> secondColorListSave})
      : _assetIdList = assetIdList,
        _firstColorListSave = firstColorListSave,
        _secondColorListSave = secondColorListSave;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final String email;
  @override
  final String imgUrl;
  @override
  final String language;
  @override
  final UserType userType;
  final List<String> _assetIdList;
  @override
  List<String> get assetIdList {
    if (_assetIdList is EqualUnmodifiableListView) return _assetIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assetIdList);
  }

  final List<String> _firstColorListSave;
  @override
  List<String> get firstColorListSave {
    if (_firstColorListSave is EqualUnmodifiableListView)
      return _firstColorListSave;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_firstColorListSave);
  }

  final List<String> _secondColorListSave;
  @override
  List<String> get secondColorListSave {
    if (_secondColorListSave is EqualUnmodifiableListView)
      return _secondColorListSave;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondColorListSave);
  }

  @override
  String toString() {
    return 'User(userId: $userId, name: $name, email: $email, imgUrl: $imgUrl, language: $language, userType: $userType, assetIdList: $assetIdList, firstColorListSave: $firstColorListSave, secondColorListSave: $secondColorListSave)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            const DeepCollectionEquality()
                .equals(other._assetIdList, _assetIdList) &&
            const DeepCollectionEquality()
                .equals(other._firstColorListSave, _firstColorListSave) &&
            const DeepCollectionEquality()
                .equals(other._secondColorListSave, _secondColorListSave));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      name,
      email,
      imgUrl,
      language,
      userType,
      const DeepCollectionEquality().hash(_assetIdList),
      const DeepCollectionEquality().hash(_firstColorListSave),
      const DeepCollectionEquality().hash(_secondColorListSave));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String userId,
      required final String name,
      required final String email,
      required final String imgUrl,
      required final String language,
      required final UserType userType,
      required final List<String> assetIdList,
      required final List<String> firstColorListSave,
      required final List<String> secondColorListSave}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  String get email;
  @override
  String get imgUrl;
  @override
  String get language;
  @override
  UserType get userType;
  @override
  List<String> get assetIdList;
  @override
  List<String> get firstColorListSave;
  @override
  List<String> get secondColorListSave;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
