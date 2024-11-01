// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floating_daangn_button.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FloatingButtonState {
  bool get isExpanded => throw _privateConstructorUsedError;
  bool get isSmall => throw _privateConstructorUsedError;
  bool get isClassified => throw _privateConstructorUsedError;
  bool get expenseSelected => throw _privateConstructorUsedError;
  bool get incomeSelected => throw _privateConstructorUsedError;
  AssetType? get assetType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FloatingButtonStateCopyWith<FloatingButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloatingButtonStateCopyWith<$Res> {
  factory $FloatingButtonStateCopyWith(
          FloatingButtonState value, $Res Function(FloatingButtonState) then) =
      _$FloatingButtonStateCopyWithImpl<$Res, FloatingButtonState>;
  @useResult
  $Res call(
      {bool isExpanded,
      bool isSmall,
      bool isClassified,
      bool expenseSelected,
      bool incomeSelected,
      AssetType? assetType});
}

/// @nodoc
class _$FloatingButtonStateCopyWithImpl<$Res, $Val extends FloatingButtonState>
    implements $FloatingButtonStateCopyWith<$Res> {
  _$FloatingButtonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
    Object? isSmall = null,
    Object? isClassified = null,
    Object? expenseSelected = null,
    Object? incomeSelected = null,
    Object? assetType = freezed,
  }) {
    return _then(_value.copyWith(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      isSmall: null == isSmall
          ? _value.isSmall
          : isSmall // ignore: cast_nullable_to_non_nullable
              as bool,
      isClassified: null == isClassified
          ? _value.isClassified
          : isClassified // ignore: cast_nullable_to_non_nullable
              as bool,
      expenseSelected: null == expenseSelected
          ? _value.expenseSelected
          : expenseSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      incomeSelected: null == incomeSelected
          ? _value.incomeSelected
          : incomeSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloatingButtonStateImplCopyWith<$Res>
    implements $FloatingButtonStateCopyWith<$Res> {
  factory _$$FloatingButtonStateImplCopyWith(_$FloatingButtonStateImpl value,
          $Res Function(_$FloatingButtonStateImpl) then) =
      __$$FloatingButtonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isExpanded,
      bool isSmall,
      bool isClassified,
      bool expenseSelected,
      bool incomeSelected,
      AssetType? assetType});
}

/// @nodoc
class __$$FloatingButtonStateImplCopyWithImpl<$Res>
    extends _$FloatingButtonStateCopyWithImpl<$Res, _$FloatingButtonStateImpl>
    implements _$$FloatingButtonStateImplCopyWith<$Res> {
  __$$FloatingButtonStateImplCopyWithImpl(_$FloatingButtonStateImpl _value,
      $Res Function(_$FloatingButtonStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
    Object? isSmall = null,
    Object? isClassified = null,
    Object? expenseSelected = null,
    Object? incomeSelected = null,
    Object? assetType = freezed,
  }) {
    return _then(_$FloatingButtonStateImpl(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      isSmall: null == isSmall
          ? _value.isSmall
          : isSmall // ignore: cast_nullable_to_non_nullable
              as bool,
      isClassified: null == isClassified
          ? _value.isClassified
          : isClassified // ignore: cast_nullable_to_non_nullable
              as bool,
      expenseSelected: null == expenseSelected
          ? _value.expenseSelected
          : expenseSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      incomeSelected: null == incomeSelected
          ? _value.incomeSelected
          : incomeSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType?,
    ));
  }
}

/// @nodoc

class _$FloatingButtonStateImpl implements _FloatingButtonState {
  const _$FloatingButtonStateImpl(
      {this.isExpanded = false,
      this.isSmall = false,
      this.isClassified = false,
      this.expenseSelected = false,
      this.incomeSelected = false,
      this.assetType});

  @override
  @JsonKey()
  final bool isExpanded;
  @override
  @JsonKey()
  final bool isSmall;
  @override
  @JsonKey()
  final bool isClassified;
  @override
  @JsonKey()
  final bool expenseSelected;
  @override
  @JsonKey()
  final bool incomeSelected;
  @override
  final AssetType? assetType;

  @override
  String toString() {
    return 'FloatingButtonState(isExpanded: $isExpanded, isSmall: $isSmall, isClassified: $isClassified, expenseSelected: $expenseSelected, incomeSelected: $incomeSelected, assetType: $assetType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloatingButtonStateImpl &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            (identical(other.isSmall, isSmall) || other.isSmall == isSmall) &&
            (identical(other.isClassified, isClassified) ||
                other.isClassified == isClassified) &&
            (identical(other.expenseSelected, expenseSelected) ||
                other.expenseSelected == expenseSelected) &&
            (identical(other.incomeSelected, incomeSelected) ||
                other.incomeSelected == incomeSelected) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExpanded, isSmall,
      isClassified, expenseSelected, incomeSelected, assetType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FloatingButtonStateImplCopyWith<_$FloatingButtonStateImpl> get copyWith =>
      __$$FloatingButtonStateImplCopyWithImpl<_$FloatingButtonStateImpl>(
          this, _$identity);
}

abstract class _FloatingButtonState implements FloatingButtonState {
  const factory _FloatingButtonState(
      {final bool isExpanded,
      final bool isSmall,
      final bool isClassified,
      final bool expenseSelected,
      final bool incomeSelected,
      final AssetType? assetType}) = _$FloatingButtonStateImpl;

  @override
  bool get isExpanded;
  @override
  bool get isSmall;
  @override
  bool get isClassified;
  @override
  bool get expenseSelected;
  @override
  bool get incomeSelected;
  @override
  AssetType? get assetType;
  @override
  @JsonKey(ignore: true)
  _$$FloatingButtonStateImplCopyWith<_$FloatingButtonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
