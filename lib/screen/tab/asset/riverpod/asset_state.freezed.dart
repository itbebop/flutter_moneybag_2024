// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssetState {
  List<Asset> get assetList => throw _privateConstructorUsedError;
  double get assetAmount => throw _privateConstructorUsedError;
  String get hints => throw _privateConstructorUsedError;
  List<String> get assetIdList => throw _privateConstructorUsedError;
  GetAssetListUseCase get getAssetListUseCase =>
      throw _privateConstructorUsedError;
  GetAssetUseCase get getAssetUseCase => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AssetStateCopyWith<AssetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetStateCopyWith<$Res> {
  factory $AssetStateCopyWith(
          AssetState value, $Res Function(AssetState) then) =
      _$AssetStateCopyWithImpl<$Res, AssetState>;
  @useResult
  $Res call(
      {List<Asset> assetList,
      double assetAmount,
      String hints,
      List<String> assetIdList,
      GetAssetListUseCase getAssetListUseCase,
      GetAssetUseCase getAssetUseCase});
}

/// @nodoc
class _$AssetStateCopyWithImpl<$Res, $Val extends AssetState>
    implements $AssetStateCopyWith<$Res> {
  _$AssetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetList = null,
    Object? assetAmount = null,
    Object? hints = null,
    Object? assetIdList = null,
    Object? getAssetListUseCase = null,
    Object? getAssetUseCase = freezed,
  }) {
    return _then(_value.copyWith(
      assetList: null == assetList
          ? _value.assetList
          : assetList // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      assetAmount: null == assetAmount
          ? _value.assetAmount
          : assetAmount // ignore: cast_nullable_to_non_nullable
              as double,
      hints: null == hints
          ? _value.hints
          : hints // ignore: cast_nullable_to_non_nullable
              as String,
      assetIdList: null == assetIdList
          ? _value.assetIdList
          : assetIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      getAssetListUseCase: null == getAssetListUseCase
          ? _value.getAssetListUseCase
          : getAssetListUseCase // ignore: cast_nullable_to_non_nullable
              as GetAssetListUseCase,
      getAssetUseCase: freezed == getAssetUseCase
          ? _value.getAssetUseCase
          : getAssetUseCase // ignore: cast_nullable_to_non_nullable
              as GetAssetUseCase,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetStateImplCopyWith<$Res>
    implements $AssetStateCopyWith<$Res> {
  factory _$$AssetStateImplCopyWith(
          _$AssetStateImpl value, $Res Function(_$AssetStateImpl) then) =
      __$$AssetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Asset> assetList,
      double assetAmount,
      String hints,
      List<String> assetIdList,
      GetAssetListUseCase getAssetListUseCase,
      GetAssetUseCase getAssetUseCase});
}

/// @nodoc
class __$$AssetStateImplCopyWithImpl<$Res>
    extends _$AssetStateCopyWithImpl<$Res, _$AssetStateImpl>
    implements _$$AssetStateImplCopyWith<$Res> {
  __$$AssetStateImplCopyWithImpl(
      _$AssetStateImpl _value, $Res Function(_$AssetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetList = null,
    Object? assetAmount = null,
    Object? hints = null,
    Object? assetIdList = null,
    Object? getAssetListUseCase = null,
    Object? getAssetUseCase = freezed,
  }) {
    return _then(_$AssetStateImpl(
      assetList: null == assetList
          ? _value._assetList
          : assetList // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      assetAmount: null == assetAmount
          ? _value.assetAmount
          : assetAmount // ignore: cast_nullable_to_non_nullable
              as double,
      hints: null == hints
          ? _value.hints
          : hints // ignore: cast_nullable_to_non_nullable
              as String,
      assetIdList: null == assetIdList
          ? _value._assetIdList
          : assetIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      getAssetListUseCase: null == getAssetListUseCase
          ? _value.getAssetListUseCase
          : getAssetListUseCase // ignore: cast_nullable_to_non_nullable
              as GetAssetListUseCase,
      getAssetUseCase: freezed == getAssetUseCase
          ? _value.getAssetUseCase
          : getAssetUseCase // ignore: cast_nullable_to_non_nullable
              as GetAssetUseCase,
    ));
  }
}

/// @nodoc

class _$AssetStateImpl implements _AssetState {
  const _$AssetStateImpl(
      {final List<Asset> assetList = const [],
      this.assetAmount = 0,
      required this.hints,
      required final List<String> assetIdList,
      required this.getAssetListUseCase,
      required this.getAssetUseCase})
      : _assetList = assetList,
        _assetIdList = assetIdList;

  final List<Asset> _assetList;
  @override
  @JsonKey()
  List<Asset> get assetList {
    if (_assetList is EqualUnmodifiableListView) return _assetList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assetList);
  }

  @override
  @JsonKey()
  final double assetAmount;
  @override
  final String hints;
  final List<String> _assetIdList;
  @override
  List<String> get assetIdList {
    if (_assetIdList is EqualUnmodifiableListView) return _assetIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assetIdList);
  }

  @override
  final GetAssetListUseCase getAssetListUseCase;
  @override
  final GetAssetUseCase getAssetUseCase;

  @override
  String toString() {
    return 'AssetState(assetList: $assetList, assetAmount: $assetAmount, hints: $hints, assetIdList: $assetIdList, getAssetListUseCase: $getAssetListUseCase, getAssetUseCase: $getAssetUseCase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetStateImpl &&
            const DeepCollectionEquality()
                .equals(other._assetList, _assetList) &&
            (identical(other.assetAmount, assetAmount) ||
                other.assetAmount == assetAmount) &&
            (identical(other.hints, hints) || other.hints == hints) &&
            const DeepCollectionEquality()
                .equals(other._assetIdList, _assetIdList) &&
            (identical(other.getAssetListUseCase, getAssetListUseCase) ||
                other.getAssetListUseCase == getAssetListUseCase) &&
            const DeepCollectionEquality()
                .equals(other.getAssetUseCase, getAssetUseCase));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_assetList),
      assetAmount,
      hints,
      const DeepCollectionEquality().hash(_assetIdList),
      getAssetListUseCase,
      const DeepCollectionEquality().hash(getAssetUseCase));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetStateImplCopyWith<_$AssetStateImpl> get copyWith =>
      __$$AssetStateImplCopyWithImpl<_$AssetStateImpl>(this, _$identity);
}

abstract class _AssetState implements AssetState {
  const factory _AssetState(
      {final List<Asset> assetList,
      final double assetAmount,
      required final String hints,
      required final List<String> assetIdList,
      required final GetAssetListUseCase getAssetListUseCase,
      required final GetAssetUseCase getAssetUseCase}) = _$AssetStateImpl;

  @override
  List<Asset> get assetList;
  @override
  double get assetAmount;
  @override
  String get hints;
  @override
  List<String> get assetIdList;
  @override
  GetAssetListUseCase get getAssetListUseCase;
  @override
  GetAssetUseCase get getAssetUseCase;
  @override
  @JsonKey(ignore: true)
  _$$AssetStateImplCopyWith<_$AssetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
