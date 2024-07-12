import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_state.freezed.dart';
part 'timer_state.g.dart';

@riverpod
class TimerStateNotifier extends _$TimerStateNotifier {
  Timer? _timer;

  @override
  TimerState build() {
    ref.onDispose(
      () {
        _timer?.cancel();
        _timer = null;
      },
    );
    return const TimerState.idle();
  }

  void start() {
    state = _transitionToRunning();
    if (_timer == null || _timer!.isActive == false) {
      _timer = Timer.periodic(
        const Duration(milliseconds: 100 ~/ 6),
        (timer) {
          final st = state;
          if (st is RunningTimerState) {
            state = _transitionToRunning();
          }
        },
      );
    }
  }

  void pause() {
    _timer?.cancel();
    state = _transitionToPaused();
  }

  void stop() {
    _timer?.cancel();
    state = _transitionToIdle();
  }

  TimerState _transitionToRunning() {
    final st = state;
    final now = _utcNowMs;
    final newState = switch (st) {
      PausedTimerState(elapsedTime: final elapsedTime) =>
        RunningTimerState(eventTime: now, offset: elapsedTime, elapsedTime: elapsedTime),
      IdleTimerState() => TimerState.running(eventTime: now, elapsedTime: 0),
      RunningTimerState() => st.copyWith(elapsedTime: now - st.eventTime + st.offset),
    };
    return newState;
  }

  TimerState _transitionToPaused() {
    final st = state;
    final now = _utcNowMs;
    final newState = switch (st) {
      PausedTimerState() => st,
      IdleTimerState() => throw StateError('Cannot transition to paused state from idle'),
      RunningTimerState(eventTime: final eventTime, offset: final offset) =>
        TimerState.paused(eventTime: now, elapsedTime: now - eventTime + offset),
    };
    return newState;
  }

  TimerState _transitionToIdle() {
    final st = state;
    final newState = switch (st) {
      PausedTimerState() => const TimerState.idle(),
      IdleTimerState() => st,
      RunningTimerState() => throw StateError('Cannot directly transition from running to idle state'),
    };
    return newState;
  }

  static get _utcNowMs => DateTime.now().toUtc().millisecondsSinceEpoch;
}

abstract interface class TimedEvent {
  /// When the event occured - recording absolute value so that valid timer state could be computed in case of
  /// appp kill or crash. TimedEvent should be persistable and restored when app starts.
  int get eventTime;

  int get elapsedTime;
}

/// Serializable timer state
@freezed
sealed class TimerState with _$TimerState {
  const factory TimerState.idle() = IdleTimerState;

  @Implements<TimedEvent>()
  const factory TimerState.running({required int eventTime, required int elapsedTime, @Default(0) int offset}) =
      RunningTimerState;

  @Implements<TimedEvent>()
  const factory TimerState.paused({required int eventTime, required int elapsedTime}) = PausedTimerState;

  factory TimerState.fromJson(Map<String, dynamic> json) => _$TimerStateFromJson(json);
}
