import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sw/screens/state/lap_time_state.dart';
import 'package:sw/widgets/control_column.dart';
import 'package:sw/widgets/lap_time_list.dart';
import 'package:sw/widgets/timer_display.dart';

import 'state/timer_state.dart';

part 'stop_watch_screen.g.dart';

@riverpod
ControlColumnVariant uiControlVariant(UiControlVariantRef ref) {
  final timerState = ref.watch(timerStateNotifierProvider);
  return switch (timerState) {
    IdleTimerState() => ControlColumnVariant.idle,
    RunningTimerState() => ControlColumnVariant.running,
    _ => ControlColumnVariant.paused
  };
}

@riverpod
int uiElapsedMs(UiElapsedMsRef ref) {
  final timerState = ref.watch(timerStateNotifierProvider);
  final elapsedMs = switch (timerState) {
    TimedEvent(elapsedTime: final elapsedTime) => elapsedTime,
    _ => 0,
  };
  return elapsedMs;
}

class StopWatchScreen extends ConsumerWidget {
  const StopWatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(timerStateNotifierProvider.notifier);
    final columnVariant = ref.watch(uiControlVariantProvider);
    final elapsedMs = ref.watch(uiElapsedMsProvider);
    final lapTimeNotifier = ref.watch(lapTimeNotifierProvider.notifier);
    final lapTimes = ref.watch(lapTimeNotifierProvider);
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Center(child: TextTimerDisplay(elapsedMilliseconds: elapsedMs)),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 40, blurStyle: BlurStyle.outer, spreadRadius: 0)
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.timer_outlined,
                      size: 120,
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: LapTimeList(laptimes: lapTimes),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60, right: 20),
                        child: ControlColumn(
                          variant: columnVariant,
                          onStart: notifier.start,
                          onPause: notifier.pause,
                          onLap: lapTimeNotifier.record,
                          onStop: () {
                            notifier.stop();
                            lapTimeNotifier.reset();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
