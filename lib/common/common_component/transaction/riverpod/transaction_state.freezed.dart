// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionState {
  bool get isLoading => throw _privateConstructorUsedError;
  CreateTransactionUseCase get createTransactionUseCase =>
      throw _privateConstructorUsedError;
  DeleteTransactionUseCase get deleteTransactionUseCase =>
      throw _privateConstructorUsedError;
  GetTransactionListUseCase get getTransactionListUseCase =>
      throw _privateConstructorUsedError;
  UpdateTransactionUseCase get updateTransactionUseCase =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionStateCopyWith<TransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res, TransactionState>;
  @useResult
  $Res call(
      {bool isLoading,
      CreateTransactionUseCase createTransactionUseCase,
      DeleteTransactionUseCase deleteTransactionUseCase,
      GetTransactionListUseCase getTransactionListUseCase,
      UpdateTransactionUseCase updateTransactionUseCase});
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? createTransactionUseCase = null,
    Object? deleteTransactionUseCase = null,
    Object? getTransactionListUseCase = null,
    Object? updateTransactionUseCase = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      createTransactionUseCase: null == createTransactionUseCase
          ? _value.createTransactionUseCase
          : createTransactionUseCase // ignore: cast_nullable_to_non_nullable
              as CreateTransactionUseCase,
      deleteTransactionUseCase: null == deleteTransactionUseCase
          ? _value.deleteTransactionUseCase
          : deleteTransactionUseCase // ignore: cast_nullable_to_non_nullable
              as DeleteTransactionUseCase,
      getTransactionListUseCase: null == getTransactionListUseCase
          ? _value.getTransactionListUseCase
          : getTransactionListUseCase // ignore: cast_nullable_to_non_nullable
              as GetTransactionListUseCase,
      updateTransactionUseCase: null == updateTransactionUseCase
          ? _value.updateTransactionUseCase
          : updateTransactionUseCase // ignore: cast_nullable_to_non_nullable
              as UpdateTransactionUseCase,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionStateImplCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory _$$TransactionStateImplCopyWith(_$TransactionStateImpl value,
          $Res Function(_$TransactionStateImpl) then) =
      __$$TransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      CreateTransactionUseCase createTransactionUseCase,
      DeleteTransactionUseCase deleteTransactionUseCase,
      GetTransactionListUseCase getTransactionListUseCase,
      UpdateTransactionUseCase updateTransactionUseCase});
}

/// @nodoc
class __$$TransactionStateImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionStateImpl>
    implements _$$TransactionStateImplCopyWith<$Res> {
  __$$TransactionStateImplCopyWithImpl(_$TransactionStateImpl _value,
      $Res Function(_$TransactionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? createTransactionUseCase = null,
    Object? deleteTransactionUseCase = null,
    Object? getTransactionListUseCase = null,
    Object? updateTransactionUseCase = null,
  }) {
    return _then(_$TransactionStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      createTransactionUseCase: null == createTransactionUseCase
          ? _value.createTransactionUseCase
          : createTransactionUseCase // ignore: cast_nullable_to_non_nullable
              as CreateTransactionUseCase,
      deleteTransactionUseCase: null == deleteTransactionUseCase
          ? _value.deleteTransactionUseCase
          : deleteTransactionUseCase // ignore: cast_nullable_to_non_nullable
              as DeleteTransactionUseCase,
      getTransactionListUseCase: null == getTransactionListUseCase
          ? _value.getTransactionListUseCase
          : getTransactionListUseCase // ignore: cast_nullable_to_non_nullable
              as GetTransactionListUseCase,
      updateTransactionUseCase: null == updateTransactionUseCase
          ? _value.updateTransactionUseCase
          : updateTransactionUseCase // ignore: cast_nullable_to_non_nullable
              as UpdateTransactionUseCase,
    ));
  }
}

/// @nodoc

class _$TransactionStateImpl implements _TransactionState {
  const _$TransactionStateImpl(
      {this.isLoading = false,
      required this.createTransactionUseCase,
      required this.deleteTransactionUseCase,
      required this.getTransactionListUseCase,
      required this.updateTransactionUseCase});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final CreateTransactionUseCase createTransactionUseCase;
  @override
  final DeleteTransactionUseCase deleteTransactionUseCase;
  @override
  final GetTransactionListUseCase getTransactionListUseCase;
  @override
  final UpdateTransactionUseCase updateTransactionUseCase;

  @override
  String toString() {
    return 'TransactionState(isLoading: $isLoading, createTransactionUseCase: $createTransactionUseCase, deleteTransactionUseCase: $deleteTransactionUseCase, getTransactionListUseCase: $getTransactionListUseCase, updateTransactionUseCase: $updateTransactionUseCase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(
                    other.createTransactionUseCase, createTransactionUseCase) ||
                other.createTransactionUseCase == createTransactionUseCase) &&
            (identical(
                    other.deleteTransactionUseCase, deleteTransactionUseCase) ||
                other.deleteTransactionUseCase == deleteTransactionUseCase) &&
            (identical(other.getTransactionListUseCase,
                    getTransactionListUseCase) ||
                other.getTransactionListUseCase == getTransactionListUseCase) &&
            (identical(
                    other.updateTransactionUseCase, updateTransactionUseCase) ||
                other.updateTransactionUseCase == updateTransactionUseCase));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      createTransactionUseCase,
      deleteTransactionUseCase,
      getTransactionListUseCase,
      updateTransactionUseCase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionStateImplCopyWith<_$TransactionStateImpl> get copyWith =>
      __$$TransactionStateImplCopyWithImpl<_$TransactionStateImpl>(
          this, _$identity);
}

abstract class _TransactionState implements TransactionState {
  const factory _TransactionState(
          {final bool isLoading,
          required final CreateTransactionUseCase createTransactionUseCase,
          required final DeleteTransactionUseCase deleteTransactionUseCase,
          required final GetTransactionListUseCase getTransactionListUseCase,
          required final UpdateTransactionUseCase updateTransactionUseCase}) =
      _$TransactionStateImpl;

  @override
  bool get isLoading;
  @override
  CreateTransactionUseCase get createTransactionUseCase;
  @override
  DeleteTransactionUseCase get deleteTransactionUseCase;
  @override
  GetTransactionListUseCase get getTransactionListUseCase;
  @override
  UpdateTransactionUseCase get updateTransactionUseCase;
  @override
  @JsonKey(ignore: true)
  _$$TransactionStateImplCopyWith<_$TransactionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}