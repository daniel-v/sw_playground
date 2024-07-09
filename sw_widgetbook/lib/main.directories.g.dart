// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:sw_widgetbook/widgets/buttons.dart' as _i2;
import 'package:sw_widgetbook/widgets/control_column.dart' as _i3;
import 'package:sw_widgetbook/widgets/lap_time.dart' as _i4;
import 'package:sw_widgetbook/widgets/lap_time_list.dart' as _i5;
import 'package:sw_widgetbook/widgets/timer_display.dart' as _i6;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookComponent(
        name: 'ActionButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'lap',
            builder: _i2.lapButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'pause',
            builder: _i2.pauseButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'start',
            builder: _i2.startButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'stop',
            builder: _i2.stopButtonUseCase,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ControlColumn',
        useCase: _i1.WidgetbookUseCase(
          name: 'idle',
          builder: _i3.controlColumnUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'LapTime',
        useCase: _i1.WidgetbookUseCase(
          name: 'LapTime',
          builder: _i4.lapTimeUseCase,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'LapTimeList',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'LapTimeList/empty',
            builder: _i5.emptyLapTimeListUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'LapTimeList/filled',
            builder: _i5.filledLapTimeListUseCase,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'TextTimerDisplay',
        useCase: _i1.WidgetbookUseCase(
          name: 'TimerDisplay/text',
          builder: _i6.textTimerDisplay,
        ),
      ),
    ],
  )
];
