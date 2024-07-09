import 'package:flutter/material.dart';
import 'package:sw/widgets/timer_display.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'TimerDisplay/text', type: TextTimerDisplay)
Widget textTimerDisplay(BuildContext context) {
  const dayInMs = 24 * 60 * 60 * 1000;
  final elapsedTime = context.knobs.int.slider(
    label: 'Elapsed milliseconds',
    min: 0,
    max: dayInMs,
    divisions: dayInMs,
  );
  return TextTimerDisplay(elapsedMilliseconds: elapsedTime);
}
