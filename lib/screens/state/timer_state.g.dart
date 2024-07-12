// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdleTimerStateImpl _$$IdleTimerStateImplFromJson(Map<String, dynamic> json) =>
    _$IdleTimerStateImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IdleTimerStateImplToJson(
        _$IdleTimerStateImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$RunningTimerStateImpl _$$RunningTimerStateImplFromJson(
        Map<String, dynamic> json) =>
    _$RunningTimerStateImpl(
      eventTime: (json['eventTime'] as num).toInt(),
      elapsedTime: (json['elapsedTime'] as num).toInt(),
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RunningTimerStateImplToJson(
        _$RunningTimerStateImpl instance) =>
    <String, dynamic>{
      'eventTime': instance.eventTime,
      'elapsedTime': instance.elapsedTime,
      'offset': instance.offset,
      'runtimeType': instance.$type,
    };

_$PausedTimerStateImpl _$$PausedTimerStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PausedTimerStateImpl(
      eventTime: (json['eventTime'] as num).toInt(),
      elapsedTime: (json['elapsedTime'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PausedTimerStateImplToJson(
        _$PausedTimerStateImpl instance) =>
    <String, dynamic>{
      'eventTime': instance.eventTime,
      'elapsedTime': instance.elapsedTime,
      'runtimeType': instance.$type,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timerStateNotifierHash() =>
    r'58856986ef9cf04822ed2e32fcd0e0a2f7c9afc4';

/// See also [TimerStateNotifier].
@ProviderFor(TimerStateNotifier)
final timerStateNotifierProvider =
    AutoDisposeNotifierProvider<TimerStateNotifier, TimerState>.internal(
  TimerStateNotifier.new,
  name: r'timerStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$timerStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TimerStateNotifier = AutoDisposeNotifier<TimerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
