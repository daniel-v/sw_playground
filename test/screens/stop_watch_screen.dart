import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sw/screens/state/timer_state.dart';
import 'package:sw/screens/stop_watch_screen.dart';
import 'package:sw/widgets/buttons.dart';


void main() {
  group('ControlColumn', () {
    testWidgets('pressing start button invokes start()', (widgetTester) async {
      final fakeNotifier = FakeStartTimer();
      await widgetTester.pumpWidget(
        ProviderScope(
          overrides: [timerStateNotifierProvider.overrideWith(() => fakeNotifier)],
          child: const Directionality(
            textDirection: TextDirection.ltr,
            child: StopWatchScreen(),
          ),
        ),
      );
      await widgetTester.tap(find.byType(StartTimerButton));
      expect(fakeNotifier.startInvoked, true);
    });
    testWidgets('pressing pause button invokes pause()', (widgetTester) async {
      final fakeNotifier = FakeStartTimer();
      await widgetTester.pumpWidget(
        ProviderScope(
          overrides: [timerStateNotifierProvider.overrideWith(() => fakeNotifier)],
          child: const Directionality(
            textDirection: TextDirection.ltr,
            child: StopWatchScreen(),
          ),
        ),
      );
      fakeNotifier.state = const TimerState.running(eventTime: 0, elapsedTime: 0);
      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.byType(PauseTimerButton));
      expect(fakeNotifier.pauseInvoked, true);
    });
    testWidgets('pressing stop button invokes stop()', (widgetTester) async {
      final fakeNotifier = FakeStartTimer();
      await widgetTester.pumpWidget(
        ProviderScope(
          overrides: [timerStateNotifierProvider.overrideWith(() => fakeNotifier)],
          child: const Directionality(
            textDirection: TextDirection.ltr,
            child: StopWatchScreen(),
          ),
        ),
      );
      fakeNotifier.state = const TimerState.paused(eventTime: 0, elapsedTime: 16);
      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.byType(ResetTimerButton));
      expect(fakeNotifier.stopInvoked, true);
    });
  });
}

class FakeStartTimer extends TimerStateNotifier {
  bool startInvoked = false;
  bool stopInvoked = false;
  bool pauseInvoked = false;

  @override
  void start() {
    startInvoked = true;
  }

  @override
  void pause() {
    pauseInvoked = true;
  }

  @override
  void stop() {
    stopInvoked = true;
  }
}
