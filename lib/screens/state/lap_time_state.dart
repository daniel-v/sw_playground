import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sw/screens/state/timer_state.dart';

part 'lap_time_state.g.dart';

@riverpod
class LapTimeNotifier extends _$LapTimeNotifier {
  @override
  List<int> build() {
    return [];
  }

  void record() {
    final timerState = ref.read(timerStateNotifierProvider);
    if (timerState is! TimedEvent) {
      throw StateError('Cannot record lap time without valid TimedEvent');
    }
    final timedEvent = (timerState as TimedEvent);
    if(state.isEmpty || timedEvent.elapsedTime != state.last) {
      state = [...state, timedEvent.elapsedTime];
    }
  }

  void reset() {
    state = [];
  }
}
