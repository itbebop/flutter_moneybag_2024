// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<String> get assetIdList => throw _privateConstructorUsedError;
  GetTransactionListUseCase get getTransactionListUseCase =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportScreenStateCopyWith<ReportScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportScreenStateCopyWith<$Res> {
  factory $ReportScreenStateCopyWith(
          ReportScreenState value, $Res Function(ReportScreenState) then) =
      _$ReportScreenStateCopyWithImpl<$Res, ReportScreenState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<String> assetIdList,
      GetTransactionListUseCase getTransactionListUseCase});
}

/// @nodoc
class _$ReportScreenStateCopyWithImpl<$Res, $Val extends ReportScreenState>
    implements $ReportScreenStateCopyWith<$Res> {
  _$ReportScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? assetIdList = null,
    Object? getTransactionListUseCase = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      assetIdList: null == assetIdList
          ? _value.assetIdList
          : assetIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      getTransactionListUseCase: null == getTransactionListUseCase
          ? _value.getTransactionListUseCase
          : getTransactionListUseCase // ignore: cast_nullable_to_non_nullable
              as GetTransactionListUseCase,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportScreenStateImplCopyWith<$Res>
    implements $ReportScreenStateCopyWith<$Res> {
  factory _$$ReportScreenStateImplCopyWith(_$ReportScreenStateImpl value,
          $Res Function(_$ReportScreenStateImpl) then) =
      __$$ReportScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<String> assetIdList,
      GetTransactionListUseCase getTransactionListUseCase});
}

/// @nodoc
class __$$ReportScreenStateImplCopyWithImpl<$Res>
    extends _$ReportScreenStateCopyWithImpl<$Res, _$ReportScreenStateImpl>
    implements _$$ReportScreenStateImplCopyWith<$Res> {
  __$$ReportScreenStateImplCopyWithImpl(_$ReportScreenStateImpl _value,
      $Res Function(_$ReportScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? assetIdList = null,
    Object? getTransactionListUseCase = null,
  }) {
    return _then(_$ReportScreenStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      assetIdList: null == assetIdList
          ? _value._assetIdList
          : assetIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      getTransactionListUseCase: null == getTransactionListUseCase
          ? _value.getTransactionListUseCase
          : getTransactionListUseCase // ignore: cast_nullable_to_non_nullable
              as GetTransactionListUseCase,
    ));
  }
}

/// @nodoc

class _$ReportScreenStateImpl implements _ReportScreenState {
  const _$ReportScreenStateImpl(
      {this.isLoading = false,
      required final List<String> assetIdList,
      required this.getTransactionListUseCase})
      : _assetIdList = assetIdList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<String> _assetIdList;
  @override
  List<String> get assetIdList {
    if (_assetIdList is EqualUnmodifiableListView) return _assetIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assetIdList);
  }

  @override
  final GetTransactionListUseCase getTransactionListUseCase;

  @override
  String toString() {
    return 'ReportScreenState(isLoading: $isLoading, assetIdList: $assetIdList, getTransactionListUseCase: $getTransactionListUseCase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportScreenStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._assetIdList, _assetIdList) &&
            (identical(other.getTransactionListUseCase,
                    getTransactionListUseCase) ||
                other.getTransactionListUseCase == getTransactionListUseCase));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_assetIdList),
      getTransactionListUseCase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportScreenStateImplCopyWith<_$ReportScreenStateImpl> get copyWith =>
      __$$ReportScreenStateImplCopyWithImpl<_$ReportScreenStateImpl>(
          this, _$identity);
}

abstract class _ReportScreenState implements ReportScreenState {
  const factory _ReportScreenState(
          {final bool isLoading,
          required final List<String> assetIdList,
          required final GetTransactionListUseCase getTransactionListUseCase}) =
      _$ReportScreenStateImpl;

  @override
  bool get isLoading;
  @override
  List<String> get assetIdList;
  @override
  GetTransactionListUseCase get getTransactionListUseCase;
  @override
  @JsonKey(ignore: true)
  _$$ReportScreenStateImplCopyWith<_$ReportScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
