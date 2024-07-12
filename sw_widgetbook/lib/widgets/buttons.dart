import 'package:flutter/material.dart';
// Import the widget from your app
import 'package:sw/widgets/buttons.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'start', type: ActionButton)
Widget startButtonUseCase(BuildContext context) {
  return const ActionButton.start();
}

@widgetbook.UseCase(name: 'stop', type: ActionButton)
Widget stopButtonUseCase(BuildContext context) {
  return const ActionButton.reset();
}

@widgetbook.UseCase(name: 'pause', type: ActionButton)
Widget pauseButtonUseCase(BuildContext context) {
  return const ActionButton.pause();
}

// @widgetbook.UseCase(name: 'reset', type: ActionButton)
// Widget resetButtonUseCase(BuildContext context) {
//   return const ActionButton.reset();
// }

@widgetbook.UseCase(name: 'lap', type: ActionButton)
Widget lapButtonUseCase(BuildContext context) {
  return const ActionButton.lap();
}
