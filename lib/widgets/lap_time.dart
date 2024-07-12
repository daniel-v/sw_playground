import 'package:flutter/material.dart';

import '../config/theme.dart';
import 'utils.dart';

class LapTime extends StatelessWidget {
  const LapTime({super.key, required this.lapNo, required this.elapsedTime});

  final int lapNo;
  final int elapsedTime;

  @override
  Widget build(BuildContext context) {
    final formattedTime = timerDefaultFormatterDelegate(elapsedTime);
    return ListTile(
      title: Text(formattedTime),
      subtitle: Text('Lap $lapNo'),
      leading: const Icon(
        Icons.timer_outlined,
        color: primary,
      ),
    );
  }
}
