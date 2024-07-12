import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sw/screens/state/timer_state.dart';
import 'package:test/test.dart';

void main() {
  ProviderContainer? container;
  setUp(() {
    container = ProviderContainer();
  });
  tearDown(() {
    container?.dispose();
  });
  test('timer is in initial state on creation', () {
    final initialState = container!.read(timerStateNotifierProvider);
    expect(initialState, isA<IdleTimerState>());
  });
  test('timer emits RunningTimerState when started with increasing elapsedTime', () async {
    final notifier = container!.read(timerStateNotifierProvider.notifier);
    late ProviderSubscription sub;
    final controller = StreamController<TimerState>();
    sub = container!.listen(
      timerStateNotifierProvider,
      (previous, next) {
        controller.add(next);
      },
    );
    final expectation = expectLater(
        controller.stream,
        emitsInOrder([
          allOf([isA<RunningTimerState>(), predicate((RunningTimerState p0) => p0.elapsedTime == 0)]),
          allOf([isA<RunningTimerState>(), predicate((RunningTimerState p0) => p0.elapsedTime > 0)]),
        ]));
    notifier.start();
    await expectation;
    sub.close();
  });
  test('timer emits PausedTimerState when paused', () async {
    final notifier = container!.read(timerStateNotifierProvider.notifier);
    late ProviderSubscription sub;
    final controller = StreamController<TimerState>();
    sub = container!.listen(timerStateNotifierProvider, (previous, next) => controller.add(next));
    final expectation = expectLater(controller.stream,
        emitsThrough(allOf([isA<RunningTimerState>(), predicate((RunningTimerState p0) => p0.elapsedTime > 0)])));
    notifier.start();
    await Future.delayed(const Duration(milliseconds: 32));
    notifier.pause();
    expect(container!.read(timerStateNotifierProvider),
        allOf(isA<PausedTimerState>(), predicate((PausedTimerState p0) => p0.elapsedTime > 0)));
    await expectation;
    sub.close();
  });
  test('timer resets when stopped after pausing', () async {
    final notifier = container!.read(timerStateNotifierProvider.notifier);
    late ProviderSubscription sub;
    final controller = StreamController<TimerState>();
    sub = container!.listen(timerStateNotifierProvider, (previous, next) => controller.add(next));
    final expectation = expectLater(controller.stream,
        emitsThrough(allOf([isA<RunningTimerState>(), predicate((RunningTimerState p0) => p0.elapsedTime > 0)])));
    notifier.start();
    await Future.delayed(const Duration(milliseconds: 32));
    notifier.pause();
    notifier.stop();
    expect(container!.read(timerStateNotifierProvider), isA<IdleTimerState>());
    await expectation;
    sub.close();
  });
  group('invalid state transitions', () {
    test('throws when transitioning from idle to paused', () {
      final notifier = container!.read(timerStateNotifierProvider.notifier);
      expect(notifier.pause, throwsStateError);
    });
    test('throws when transitioning from running to idle', () {
      final notifier = container!.read(timerStateNotifierProvider.notifier);
      notifier.start();
      expect(notifier.stop, throwsStateError);
    });
  });
}
