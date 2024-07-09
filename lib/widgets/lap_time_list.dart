import 'package:flutter/material.dart';
import 'package:sw/widgets/lap_time.dart';

class LapTimeList extends StatelessWidget {
  const LapTimeList({super.key, required this.laptimes});

  final List<int> laptimes;

  @override
  Widget build(BuildContext context) {
    if (laptimes.isEmpty) {
      return const Center(child: Text('No lap times recorded yet'));
    }
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      itemBuilder: (context, index) {
        final time = laptimes[index];
        return LapTime(lapNo: index + 1, elapsedTime: '$time');
      },
      separatorBuilder: (context, index) => index >= 2 ? const SizedBox.shrink() : const SizedBox(height: 10),
      itemCount: laptimes.length,
    );
  }
}
