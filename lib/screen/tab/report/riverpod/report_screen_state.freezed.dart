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
  Period get period => throw _privateConstructorUsedError;

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
  $Res call({bool isLoading, Period period});
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
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
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
  $Res call({bool isLoading, Period period});
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
    Object? period = freezed,
  }) {
    return _then(_$ReportScreenStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
    ));
  }
}

/// @nodoc

class _$ReportScreenStateImpl implements _ReportScreenState {
  const _$ReportScreenStateImpl(
      {this.isLoading = false, this.period = Period.year});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final Period period;

  @override
  String toString() {
    return 'ReportScreenState(isLoading: $isLoading, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportScreenStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.period, period));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(period));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportScreenStateImplCopyWith<_$ReportScreenStateImpl> get copyWith =>
      __$$ReportScreenStateImplCopyWithImpl<_$ReportScreenStateImpl>(
          this, _$identity);
}

abstract class _ReportScreenState implements ReportScreenState {
  const factory _ReportScreenState(
      {final bool isLoading, final Period period}) = _$ReportScreenStateImpl;

  @override
  bool get isLoading;
  @override
  Period get period;
  @override
  @JsonKey(ignore: true)
  _$$ReportScreenStateImplCopyWith<_$ReportScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
