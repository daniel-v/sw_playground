import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sw/widgets/lap_time.dart';

class LapTimeList extends StatefulWidget {
  const LapTimeList({super.key, required this.laptimes});

  final List<int> laptimes;

  @override
  State<LapTimeList> createState() => _LapTimeListState();
}

class _LapTimeListState extends State<LapTimeList> {
  late final _scrollController = ScrollController(
    debugLabel: 'LapTimesScrollController',
    onAttach: (position) => _canScroll = true,
    onDetach: (position) => _canScroll = false,
  );
  bool _canScroll = false;

  @override
  void didUpdateWidget(covariant LapTimeList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_canScroll && !oldWidget.laptimes.equals(widget.laptimes)) {
      scheduleMicrotask(() {
        if (!mounted) return;
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.laptimes.isEmpty) {
      return const Center(child: Text('No lap times recorded yet', style: TextStyle(fontSize: 16, color: Colors.black45),));
    }
    return ListView.separated(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final time = widget.laptimes[index];
        return LapTime(lapNo: index + 1, elapsedTime: time);
      },
      separatorBuilder: (context, index) => index >= 2 ? const SizedBox.shrink() : const SizedBox(height: 10),
      itemCount: widget.laptimes.length,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
