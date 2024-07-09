import 'package:flutter/material.dart';
// Import the widget from your app
import 'package:sw/widgets/lap_time_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'LapTimeList/empty', type: LapTimeList)
Widget emptyLapTimeListUseCase(BuildContext context) {
  // final no = context.knobs.int
  //     .slider(label: 'Lap No.', min: 1, max: 99, initialValue: 1, description: 'Lap number');
  return const LapTimeList(
    laptimes: [],
  );
}

@widgetbook.UseCase(name: 'LapTimeList/filled', type: LapTimeList)
Widget filledLapTimeListUseCase(BuildContext context) {
  // final no = context.knobs.int
  //     .slider(label: 'Lap No.', min: 1, max: 99, initialValue: 1, description: 'Lap number');
  return const LapTimeList(
    laptimes: [45678, 9966554],
  );
}
