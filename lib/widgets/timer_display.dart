import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef FormattingDelegate = String Function(int ms);

final class TextTimerDisplay extends StatelessWidget {
  const TextTimerDisplay(
      {super.key, required this.elapsedMilliseconds, this.formattingDelegate = defaultFormattingDelegate});

  final int elapsedMilliseconds;
  final FormattingDelegate formattingDelegate;

  @override
  Widget build(BuildContext context) {
    return Text(formattingDelegate(elapsedMilliseconds));
  }
}

String defaultFormattingDelegate(int ms) {
  final duration = Duration(milliseconds: ms);
  final buffer = StringBuffer();
  if (duration.inDays > 0) {
    buffer.write('${duration.inDays.format}:');
  }
  final dateFormat = DateFormat('HH:mm:ss');
  final date = DateTime(0).add(duration);
  buffer
    ..write(dateFormat.format(date))
    ..write('.${ms % 1000}');
  return buffer.toString();
}

extension _FormatExtension on int {
  String get format => '$this'.padLeft(2, '0');
}
