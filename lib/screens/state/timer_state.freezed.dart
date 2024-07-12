// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerState _$TimerStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'idle':
      return IdleTimerState.fromJson(json);
    case 'running':
      return RunningTimerState.fromJson(json);
    case 'paused':
      return PausedTimerState.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TimerState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TimerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int eventTime, int elapsedTime, int offset)
        running,
    required TResult Function(int eventTime, int elapsedTime) paused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int eventTime, int elapsedTime, int offset)? running,
    TResult? Function(int eventTime, int elapsedTime)? paused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int eventTime, int elapsedTime, int offset)? running,
    TResult Function(int eventTime, int elapsedTime)? paused,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleTimerState value) idle,
    required TResult Function(RunningTimerState value) running,
    required TResult Function(PausedTimerState value) paused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleTimerState value)? idle,
    TResult? Function(RunningTimerState value)? running,
    TResult? Function(PausedTimerState value)? paused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleTimerState value)? idle,
    TResult Function(RunningTimerState value)? running,
    TResult Function(PausedTimerState value)? paused,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleTimerStateImplCopyWith<$Res> {
  factory _$$IdleTimerStateImplCopyWith(_$IdleTimerStateImpl value,
          $Res Function(_$IdleTimerStateImpl) then) =
      __$$IdleTimerStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleTimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$IdleTimerStateImpl>
    implements _$$IdleTimerStateImplCopyWith<$Res> {
  __$$IdleTimerStateImplCopyWithImpl(
      _$IdleTimerStateImpl _value, $Res Function(_$IdleTimerStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$IdleTimerStateImpl implements IdleTimerState {
  const _$IdleTimerStateImpl({final String? $type}) : $type = $type ?? 'idle';

  factory _$IdleTimerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdleTimerStateImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TimerState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleTimerStateImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int eventTime, int elapsedTime, int offset)
        running,
    required TResult Function(int eventTime, int elapsedTime) paused,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int eventTime, int elapsedTime, int offset)? running,
    TResult? Function(int eventTime, int elapsedTime)? paused,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int eventTime, int elapsedTime, int offset)? running,
    TResult Function(int eventTime, int elapsedTime)? paused,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleTimerState value) idle,
    required TResult Function(RunningTimerState value) running,
    required TResult Function(PausedTimerState value) paused,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleTimerState value)? idle,
    TResult? Function(RunningTimerState value)? running,
    TResult? Function(PausedTimerState value)? paused,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleTimerState value)? idle,
    TResult Function(RunningTimerState value)? running,
    TResult Function(PausedTimerState value)? paused,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IdleTimerStateImplToJson(
      this,
    );
  }
}

abstract class IdleTimerState implements TimerState {
  const factory IdleTimerState() = _$IdleTimerStateImpl;

  factory IdleTimerState.fromJson(Map<String, dynamic> json) =
      _$IdleTimerStateImpl.fromJson;
}

/// @nodoc
abstract class _$$RunningTimerStateImplCopyWith<$Res> {
  factory _$$RunningTimerStateImplCopyWith(_$RunningTimerStateImpl value,
          $Res Function(_$RunningTimerStateImpl) then) =
      __$$RunningTimerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int eventTime, int elapsedTime, int offset});
}

/// @nodoc
class __$$RunningTimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$RunningTimerStateImpl>
    implements _$$RunningTimerStateImplCopyWith<$Res> {
  __$$RunningTimerStateImplCopyWithImpl(_$RunningTimerStateImpl _value,
      $Res Function(_$RunningTimerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventTime = null,
    Object? elapsedTime = null,
    Object? offset = null,
  }) {
    return _then(_$RunningTimerStateImpl(
      eventTime: null == eventTime
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as int,
      elapsedTime: null == elapsedTime
          ? _value.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RunningTimerStateImpl implements RunningTimerState {
  const _$RunningTimerStateImpl(
      {required this.eventTime,
      required this.elapsedTime,
      this.offset = 0,
      final String? $type})
      : $type = $type ?? 'running';

  factory _$RunningTimerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunningTimerStateImplFromJson(json);

  @override
  final int eventTime;
  @override
  final int elapsedTime;
  @override
  @JsonKey()
  final int offset;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TimerState.running(eventTime: $eventTime, elapsedTime: $elapsedTime, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningTimerStateImpl &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
            (identical(other.elapsedTime, elapsedTime) ||
                other.elapsedTime == elapsedTime) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventTime, elapsedTime, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningTimerStateImplCopyWith<_$RunningTimerStateImpl> get copyWith =>
      __$$RunningTimerStateImplCopyWithImpl<_$RunningTimerStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int eventTime, int elapsedTime, int offset)
        running,
    required TResult Function(int eventTime, int elapsedTime) paused,
  }) {
    return running(eventTime, elapsedTime, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int eventTime, int elapsedTime, int offset)? running,
    TResult? Function(int eventTime, int elapsedTime)? paused,
  }) {
    return running?.call(eventTime, elapsedTime, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int eventTime, int elapsedTime, int offset)? running,
    TResult Function(int eventTime, int elapsedTime)? paused,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(eventTime, elapsedTime, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleTimerState value) idle,
    required TResult Function(RunningTimerState value) running,
    required TResult Function(PausedTimerState value) paused,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleTimerState value)? idle,
    TResult? Function(RunningTimerState value)? running,
    TResult? Function(PausedTimerState value)? paused,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleTimerState value)? idle,
    TResult Function(RunningTimerState value)? running,
    TResult Function(PausedTimerState value)? paused,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RunningTimerStateImplToJson(
      this,
    );
  }
}

abstract class RunningTimerState implements TimerState, TimedEvent {
  const factory RunningTimerState(
      {required final int eventTime,
      required final int elapsedTime,
      final int offset}) = _$RunningTimerStateImpl;

  factory RunningTimerState.fromJson(Map<String, dynamic> json) =
      _$RunningTimerStateImpl.fromJson;

  int get eventTime;
  int get elapsedTime;
  int get offset;
  @JsonKey(ignore: true)
  _$$RunningTimerStateImplCopyWith<_$RunningTimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PausedTimerStateImplCopyWith<$Res> {
  factory _$$PausedTimerStateImplCopyWith(_$PausedTimerStateImpl value,
          $Res Function(_$PausedTimerStateImpl) then) =
      __$$PausedTimerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int eventTime, int elapsedTime});
}

/// @nodoc
class __$$PausedTimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$PausedTimerStateImpl>
    implements _$$PausedTimerStateImplCopyWith<$Res> {
  __$$PausedTimerStateImplCopyWithImpl(_$PausedTimerStateImpl _value,
      $Res Function(_$PausedTimerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventTime = null,
    Object? elapsedTime = null,
  }) {
    return _then(_$PausedTimerStateImpl(
      eventTime: null == eventTime
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as int,
      elapsedTime: null == elapsedTime
          ? _value.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PausedTimerStateImpl implements PausedTimerState {
  const _$PausedTimerStateImpl(
      {required this.eventTime, required this.elapsedTime, final String? $type})
      : $type = $type ?? 'paused';

  factory _$PausedTimerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PausedTimerStateImplFromJson(json);

  @override
  final int eventTime;
  @override
  final int elapsedTime;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TimerState.paused(eventTime: $eventTime, elapsedTime: $elapsedTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PausedTimerStateImpl &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
            (identical(other.elapsedTime, elapsedTime) ||
                other.elapsedTime == elapsedTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventTime, elapsedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PausedTimerStateImplCopyWith<_$PausedTimerStateImpl> get copyWith =>
      __$$PausedTimerStateImplCopyWithImpl<_$PausedTimerStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int eventTime, int elapsedTime, int offset)
        running,
    required TResult Function(int eventTime, int elapsedTime) paused,
  }) {
    return paused(eventTime, elapsedTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int eventTime, int elapsedTime, int offset)? running,
    TResult? Function(int eventTime, int elapsedTime)? paused,
  }) {
    return paused?.call(eventTime, elapsedTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int eventTime, int elapsedTime, int offset)? running,
    TResult Function(int eventTime, int elapsedTime)? paused,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(eventTime, elapsedTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleTimerState value) idle,
    required TResult Function(RunningTimerState value) running,
    required TResult Function(PausedTimerState value) paused,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleTimerState value)? idle,
    TResult? Function(RunningTimerState value)? running,
    TResult? Function(PausedTimerState value)? paused,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleTimerState value)? idle,
    TResult Function(RunningTimerState value)? running,
    TResult Function(PausedTimerState value)? paused,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PausedTimerStateImplToJson(
      this,
    );
  }
}

abstract class PausedTimerState implements TimerState, TimedEvent {
  const factory PausedTimerState(
      {required final int eventTime,
      required final int elapsedTime}) = _$PausedTimerStateImpl;

  factory PausedTimerState.fromJson(Map<String, dynamic> json) =
      _$PausedTimerStateImpl.fromJson;

  int get eventTime;
  int get elapsedTime;
  @JsonKey(ignore: true)
  _$$PausedTimerStateImplCopyWith<_$PausedTimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
