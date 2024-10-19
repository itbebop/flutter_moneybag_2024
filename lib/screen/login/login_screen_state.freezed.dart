// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isNewUser => throw _privateConstructorUsedError;
  LoginUseCase get loginUseCase => throw _privateConstructorUsedError;
  LogoutUseCase get logoutUseCase => throw _privateConstructorUsedError;
  CheckUserDuplicatedUseCase get checkUserDuplicatedUseCase =>
      throw _privateConstructorUsedError;
  CreateUserUseCase get createUserUseCase => throw _privateConstructorUsedError;
  CreateAssetUseCase get createAssetUseCase =>
      throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginScreenStateCopyWith<LoginScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenStateCopyWith<$Res> {
  factory $LoginScreenStateCopyWith(
          LoginScreenState value, $Res Function(LoginScreenState) then) =
      _$LoginScreenStateCopyWithImpl<$Res, LoginScreenState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isNewUser,
      LoginUseCase loginUseCase,
      LogoutUseCase logoutUseCase,
      CheckUserDuplicatedUseCase checkUserDuplicatedUseCase,
      CreateUserUseCase createUserUseCase,
      CreateAssetUseCase createAssetUseCase,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginScreenStateCopyWithImpl<$Res, $Val extends LoginScreenState>
    implements $LoginScreenStateCopyWith<$Res> {
  _$LoginScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isNewUser = null,
    Object? loginUseCase = null,
    Object? logoutUseCase = null,
    Object? checkUserDuplicatedUseCase = null,
    Object? createUserUseCase = null,
    Object? createAssetUseCase = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
      loginUseCase: null == loginUseCase
          ? _value.loginUseCase
          : loginUseCase // ignore: cast_nullable_to_non_nullable
              as LoginUseCase,
      logoutUseCase: null == logoutUseCase
          ? _value.logoutUseCase
          : logoutUseCase // ignore: cast_nullable_to_non_nullable
              as LogoutUseCase,
      checkUserDuplicatedUseCase: null == checkUserDuplicatedUseCase
          ? _value.checkUserDuplicatedUseCase
          : checkUserDuplicatedUseCase // ignore: cast_nullable_to_non_nullable
              as CheckUserDuplicatedUseCase,
      createUserUseCase: null == createUserUseCase
          ? _value.createUserUseCase
          : createUserUseCase // ignore: cast_nullable_to_non_nullable
              as CreateUserUseCase,
      createAssetUseCase: null == createAssetUseCase
          ? _value.createAssetUseCase
          : createAssetUseCase // ignore: cast_nullable_to_non_nullable
              as CreateAssetUseCase,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginScreenStateImplCopyWith<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  factory _$$LoginScreenStateImplCopyWith(_$LoginScreenStateImpl value,
          $Res Function(_$LoginScreenStateImpl) then) =
      __$$LoginScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isNewUser,
      LoginUseCase loginUseCase,
      LogoutUseCase logoutUseCase,
      CheckUserDuplicatedUseCase checkUserDuplicatedUseCase,
      CreateUserUseCase createUserUseCase,
      CreateAssetUseCase createAssetUseCase,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$LoginScreenStateImplCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res, _$LoginScreenStateImpl>
    implements _$$LoginScreenStateImplCopyWith<$Res> {
  __$$LoginScreenStateImplCopyWithImpl(_$LoginScreenStateImpl _value,
      $Res Function(_$LoginScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isNewUser = null,
    Object? loginUseCase = null,
    Object? logoutUseCase = null,
    Object? checkUserDuplicatedUseCase = null,
    Object? createUserUseCase = null,
    Object? createAssetUseCase = null,
    Object? user = freezed,
  }) {
    return _then(_$LoginScreenStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
      loginUseCase: null == loginUseCase
          ? _value.loginUseCase
          : loginUseCase // ignore: cast_nullable_to_non_nullable
              as LoginUseCase,
      logoutUseCase: null == logoutUseCase
          ? _value.logoutUseCase
          : logoutUseCase // ignore: cast_nullable_to_non_nullable
              as LogoutUseCase,
      checkUserDuplicatedUseCase: null == checkUserDuplicatedUseCase
          ? _value.checkUserDuplicatedUseCase
          : checkUserDuplicatedUseCase // ignore: cast_nullable_to_non_nullable
              as CheckUserDuplicatedUseCase,
      createUserUseCase: null == createUserUseCase
          ? _value.createUserUseCase
          : createUserUseCase // ignore: cast_nullable_to_non_nullable
              as CreateUserUseCase,
      createAssetUseCase: null == createAssetUseCase
          ? _value.createAssetUseCase
          : createAssetUseCase // ignore: cast_nullable_to_non_nullable
              as CreateAssetUseCase,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$LoginScreenStateImpl implements _LoginScreenState {
  const _$LoginScreenStateImpl(
      {this.isLoading = false,
      this.isNewUser = false,
      required this.loginUseCase,
      required this.logoutUseCase,
      required this.checkUserDuplicatedUseCase,
      required this.createUserUseCase,
      required this.createAssetUseCase,
      this.user});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isNewUser;
  @override
  final LoginUseCase loginUseCase;
  @override
  final LogoutUseCase logoutUseCase;
  @override
  final CheckUserDuplicatedUseCase checkUserDuplicatedUseCase;
  @override
  final CreateUserUseCase createUserUseCase;
  @override
  final CreateAssetUseCase createAssetUseCase;
  @override
  final User? user;

  @override
  String toString() {
    return 'LoginScreenState(isLoading: $isLoading, isNewUser: $isNewUser, loginUseCase: $loginUseCase, logoutUseCase: $logoutUseCase, checkUserDuplicatedUseCase: $checkUserDuplicatedUseCase, createUserUseCase: $createUserUseCase, createAssetUseCase: $createAssetUseCase, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginScreenStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser) &&
            (identical(other.loginUseCase, loginUseCase) ||
                other.loginUseCase == loginUseCase) &&
            (identical(other.logoutUseCase, logoutUseCase) ||
                other.logoutUseCase == logoutUseCase) &&
            (identical(other.checkUserDuplicatedUseCase,
                    checkUserDuplicatedUseCase) ||
                other.checkUserDuplicatedUseCase ==
                    checkUserDuplicatedUseCase) &&
            (identical(other.createUserUseCase, createUserUseCase) ||
                other.createUserUseCase == createUserUseCase) &&
            (identical(other.createAssetUseCase, createAssetUseCase) ||
                other.createAssetUseCase == createAssetUseCase) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isNewUser,
      loginUseCase,
      logoutUseCase,
      checkUserDuplicatedUseCase,
      createUserUseCase,
      createAssetUseCase,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginScreenStateImplCopyWith<_$LoginScreenStateImpl> get copyWith =>
      __$$LoginScreenStateImplCopyWithImpl<_$LoginScreenStateImpl>(
          this, _$identity);
}

abstract class _LoginScreenState implements LoginScreenState {
  const factory _LoginScreenState(
      {final bool isLoading,
      final bool isNewUser,
      required final LoginUseCase loginUseCase,
      required final LogoutUseCase logoutUseCase,
      required final CheckUserDuplicatedUseCase checkUserDuplicatedUseCase,
      required final CreateUserUseCase createUserUseCase,
      required final CreateAssetUseCase createAssetUseCase,
      final User? user}) = _$LoginScreenStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isNewUser;
  @override
  LoginUseCase get loginUseCase;
  @override
  LogoutUseCase get logoutUseCase;
  @override
  CheckUserDuplicatedUseCase get checkUserDuplicatedUseCase;
  @override
  CreateUserUseCase get createUserUseCase;
  @override
  CreateAssetUseCase get createAssetUseCase;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$LoginScreenStateImplCopyWith<_$LoginScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
