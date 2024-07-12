import 'package:flutter/material.dart';
import 'package:sw/config/consts.dart';

import 'utils.dart';

typedef FormattingDelegate = String Function(int ms);

final class TextTimerDisplay extends StatelessWidget {
  const TextTimerDisplay({
    super.key,
    required this.elapsedMilliseconds,
    this.formattingDelegate = timerDefaultFormatterDelegate,
  });

  final int elapsedMilliseconds;
  final FormattingDelegate formattingDelegate;

  @override
  Widget build(BuildContext context) {
    return Text(
      formattingDelegate(elapsedMilliseconds),
      style: TextStyle(fontFamily: AppFont.B612.fontId, fontSize: 40, letterSpacing: 3),
    );
  }
}
