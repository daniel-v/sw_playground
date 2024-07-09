import 'package:flutter/material.dart';
// Import the widget from your app
import 'package:sw/widgets/control_column.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'idle', type: ControlColumn)
Widget controlColumnUseCase(BuildContext context) {
  final variant = context.knobs.list(
      label: 'State',
      options: ControlColumnVariant.values,
      // note: this is really old-school - pattern matching is a better choice now
      labelBuilder: (value) => switch (value) {
            ControlColumnVariant.idle => 'Idle',
            ControlColumnVariant.paused => 'Paused',
            ControlColumnVariant.running => 'Running'
          },
      initialOption: ControlColumnVariant.idle);
  final animationDuration = context.knobs.duration(
      label: 'Animation duration',
      initialValue: const Duration(milliseconds: 150),
      description: 'The speed with which the animation between different variants appear. Defaults to 150ms');
  return SizedBox(
    width: 60,
    height: 400,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
      ),
      child: ControlColumnProvider(
        config: ControlColumnConfig(
          animationDuration: animationDuration,
        ),
        child: ControlColumn(variant: variant, key: _key),
      ),
    ),
  );
}

final _key = GlobalKey();
