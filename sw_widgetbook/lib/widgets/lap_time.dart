import 'package:flutter/material.dart';

// Import the widget from your app
import 'package:sw/widgets/lap_time.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'LapTime', type: LapTime)
Widget lapTimeUseCase(BuildContext context) {
  final no = context.knobs.int.slider(label: 'Lap No.', min: 1, max: 99, initialValue: 1, description: 'Lap number');
  return LapTime(lapNo: no, elapsedTime: 34567);
}
