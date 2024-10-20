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
  List<String> get assetIdList => throw _privateConstructorUsedError;
  List<Asset> get activatedAssetList => throw _privateConstructorUsedError;
  GetAssetListUseCase get getAssetListUseCase =>
      throw _privateConstructorUsedError;

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
      {List<String> assetIdList,
      List<Asset> activatedAssetList,
      GetAssetListUseCase getAssetListUseCase});
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
    Object? assetIdList = null,
    Object? activatedAssetList = null,
    Object? getAssetListUseCase = null,
  }) {
    return _then(_value.copyWith(
      assetIdList: null == assetIdList
          ? _value.assetIdList
          : assetIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activatedAssetList: null == activatedAssetList
          ? _value.activatedAssetList
          : activatedAssetList // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      getAssetListUseCase: null == getAssetListUseCase
          ? _value.getAssetListUseCase
          : getAssetListUseCase // ignore: cast_nullable_to_non_nullable
              as GetAssetListUseCase,
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
      {List<String> assetIdList,
      List<Asset> activatedAssetList,
      GetAssetListUseCase getAssetListUseCase});
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
    Object? assetIdList = null,
    Object? activatedAssetList = null,
    Object? getAssetListUseCase = null,
  }) {
    return _then(_$AssetStateImpl(
      assetIdList: null == assetIdList
          ? _value._assetIdList
          : assetIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activatedAssetList: null == activatedAssetList
          ? _value._activatedAssetList
          : activatedAssetList // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      getAssetListUseCase: null == getAssetListUseCase
          ? _value.getAssetListUseCase
          : getAssetListUseCase // ignore: cast_nullable_to_non_nullable
              as GetAssetListUseCase,
    ));
  }
}

/// @nodoc

class _$AssetStateImpl implements _AssetState {
  const _$AssetStateImpl(
      {required final List<String> assetIdList,
      required final List<Asset> activatedAssetList,
      required this.getAssetListUseCase})
      : _assetIdList = assetIdList,
        _activatedAssetList = activatedAssetList;

  final List<String> _assetIdList;
  @override
  List<String> get assetIdList {
    if (_assetIdList is EqualUnmodifiableListView) return _assetIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assetIdList);
  }

  final List<Asset> _activatedAssetList;
  @override
  List<Asset> get activatedAssetList {
    if (_activatedAssetList is EqualUnmodifiableListView)
      return _activatedAssetList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activatedAssetList);
  }

  @override
  final GetAssetListUseCase getAssetListUseCase;

  @override
  String toString() {
    return 'AssetState(assetIdList: $assetIdList, activatedAssetList: $activatedAssetList, getAssetListUseCase: $getAssetListUseCase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetStateImpl &&
            const DeepCollectionEquality()
                .equals(other._assetIdList, _assetIdList) &&
            const DeepCollectionEquality()
                .equals(other._activatedAssetList, _activatedAssetList) &&
            (identical(other.getAssetListUseCase, getAssetListUseCase) ||
                other.getAssetListUseCase == getAssetListUseCase));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_assetIdList),
      const DeepCollectionEquality().hash(_activatedAssetList),
      getAssetListUseCase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetStateImplCopyWith<_$AssetStateImpl> get copyWith =>
      __$$AssetStateImplCopyWithImpl<_$AssetStateImpl>(this, _$identity);
}

abstract class _AssetState implements AssetState {
  const factory _AssetState(
          {required final List<String> assetIdList,
          required final List<Asset> activatedAssetList,
          required final GetAssetListUseCase getAssetListUseCase}) =
      _$AssetStateImpl;

  @override
  List<String> get assetIdList;
  @override
  List<Asset> get activatedAssetList;
  @override
  GetAssetListUseCase get getAssetListUseCase;
  @override
  @JsonKey(ignore: true)
  _$$AssetStateImplCopyWith<_$AssetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
