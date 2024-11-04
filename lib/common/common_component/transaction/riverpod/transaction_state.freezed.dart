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
  List<TransactionDetail> get events => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get selectedDay => throw _privateConstructorUsedError;
  DateTime get focusedDay => throw _privateConstructorUsedError;
  ValueNotifier<List<TransactionDetail>> get selectedEvents =>
      throw _privateConstructorUsedError;
  String get assetId => throw _privateConstructorUsedError;
  AssetType get assetType => throw _privateConstructorUsedError;
  List<String> get assetIdList => throw _privateConstructorUsedError;
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
      List<TransactionDetail> events,
      String userId,
      DateTime selectedDay,
      DateTime focusedDay,
      ValueNotifier<List<TransactionDetail>> selectedEvents,
      String assetId,
      AssetType assetType,
      List<String> assetIdList,
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
    Object? events = null,
    Object? userId = null,
    Object? selectedDay = null,
    Object? focusedDay = null,
    Object? selectedEvents = null,
    Object? assetId = null,
    Object? assetType = null,
    Object? assetIdList = null,
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
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<TransactionDetail>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedEvents: null == selectedEvents
          ? _value.selectedEvents
          : selectedEvents // ignore: cast_nullable_to_non_nullable
              as ValueNotifier<List<TransactionDetail>>,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
      assetIdList: null == assetIdList
          ? _value.assetIdList
          : assetIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      List<TransactionDetail> events,
      String userId,
      DateTime selectedDay,
      DateTime focusedDay,
      ValueNotifier<List<TransactionDetail>> selectedEvents,
      String assetId,
      AssetType assetType,
      List<String> assetIdList,
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
    Object? events = null,
    Object? userId = null,
    Object? selectedDay = null,
    Object? focusedDay = null,
    Object? selectedEvents = null,
    Object? assetId = null,
    Object? assetType = null,
    Object? assetIdList = null,
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
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<TransactionDetail>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedEvents: null == selectedEvents
          ? _value.selectedEvents
          : selectedEvents // ignore: cast_nullable_to_non_nullable
              as ValueNotifier<List<TransactionDetail>>,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
      assetIdList: null == assetIdList
          ? _value._assetIdList
          : assetIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      final List<TransactionDetail> events = const [],
      required this.userId,
      required this.selectedDay,
      required this.focusedDay,
      required this.selectedEvents,
      required this.assetId,
      required this.assetType,
      required final List<String> assetIdList,
      required this.createTransactionUseCase,
      required this.deleteTransactionUseCase,
      required this.getTransactionListUseCase,
      required this.updateTransactionUseCase})
      : _events = events,
        _assetIdList = assetIdList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<TransactionDetail> _events;
  @override
  @JsonKey()
  List<TransactionDetail> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final String userId;
  @override
  final DateTime selectedDay;
  @override
  final DateTime focusedDay;
  @override
  final ValueNotifier<List<TransactionDetail>> selectedEvents;
  @override
  final String assetId;
  @override
  final AssetType assetType;
  final List<String> _assetIdList;
  @override
  List<String> get assetIdList {
    if (_assetIdList is EqualUnmodifiableListView) return _assetIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assetIdList);
  }

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
    return 'TransactionState(isLoading: $isLoading, events: $events, userId: $userId, selectedDay: $selectedDay, focusedDay: $focusedDay, selectedEvents: $selectedEvents, assetId: $assetId, assetType: $assetType, assetIdList: $assetIdList, createTransactionUseCase: $createTransactionUseCase, deleteTransactionUseCase: $deleteTransactionUseCase, getTransactionListUseCase: $getTransactionListUseCase, updateTransactionUseCase: $updateTransactionUseCase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay) &&
            (identical(other.selectedEvents, selectedEvents) ||
                other.selectedEvents == selectedEvents) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            const DeepCollectionEquality()
                .equals(other._assetIdList, _assetIdList) &&
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
      const DeepCollectionEquality().hash(_events),
      userId,
      selectedDay,
      focusedDay,
      selectedEvents,
      assetId,
      assetType,
      const DeepCollectionEquality().hash(_assetIdList),
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
          final List<TransactionDetail> events,
          required final String userId,
          required final DateTime selectedDay,
          required final DateTime focusedDay,
          required final ValueNotifier<List<TransactionDetail>> selectedEvents,
          required final String assetId,
          required final AssetType assetType,
          required final List<String> assetIdList,
          required final CreateTransactionUseCase createTransactionUseCase,
          required final DeleteTransactionUseCase deleteTransactionUseCase,
          required final GetTransactionListUseCase getTransactionListUseCase,
          required final UpdateTransactionUseCase updateTransactionUseCase}) =
      _$TransactionStateImpl;

  @override
  bool get isLoading;
  @override
  List<TransactionDetail> get events;
  @override
  String get userId;
  @override
  DateTime get selectedDay;
  @override
  DateTime get focusedDay;
  @override
  ValueNotifier<List<TransactionDetail>> get selectedEvents;
  @override
  String get assetId;
  @override
  AssetType get assetType;
  @override
  List<String> get assetIdList;
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
