import 'package:flutter/material.dart';
import 'package:sw/widgets/control_column.dart';
import 'package:sw/widgets/lap_time_list.dart';
import 'package:sw/widgets/timer_display.dart';

class StopWatchScreen extends StatelessWidget {
  const StopWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Center(child: TextTimerDisplay(elapsedMilliseconds: 37654)),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Row(
              children: [
                Expanded(child: LapTimeList(laptimes: [])),
                ControlColumn(variant: ControlColumnVariant.running),
              ],
            ),
          )
        ],
      ),
    );
  }
}
