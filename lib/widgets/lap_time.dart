import 'package:flutter/material.dart';

class LapTime extends StatelessWidget {
  const LapTime({super.key, required this.lapNo, required this.elapsedTime});

  final int lapNo;
  final String elapsedTime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(elapsedTime),
      subtitle: Text('Lap $lapNo'),
    );
  }
}
