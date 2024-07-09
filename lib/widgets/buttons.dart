import 'package:flutter/material.dart';

sealed class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.icon, this.onPressed});

  const factory ActionButton.lap({VoidCallback? onPressed}) = _LapTimer;

  const factory ActionButton.pause({VoidCallback? onPressed}) = _PauseTimer;

  // const factory ActionButton.reset({VoidCallback? onPressed}) = _ResetTimer;

  const factory ActionButton.start({VoidCallback? onPressed}) = _StartTimer;

  const factory ActionButton.stop({VoidCallback? onPressed}) = _StopTimer;

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(onPressed: onPressed, icon: Icon(icon).expanded);
  }
}

final class _StartTimer extends ActionButton {
  const _StartTimer({super.onPressed}) : super(icon: Icons.play_arrow_rounded);
}

final class _StopTimer extends ActionButton {
  const _StopTimer({super.onPressed}) : super(icon: Icons.stop_rounded);
}

final class _PauseTimer extends ActionButton {
  const _PauseTimer({super.onPressed}) : super(icon: Icons.pause_rounded);
}

// final class _ResetTimer extends ActionButton {
//   const _ResetTimer({super.onPressed}) : super(icon: Icons.refresh_rounded);
// }

final class _LapTimer extends ActionButton {
  const _LapTimer({super.onPressed}) : super(icon: Icons.access_time_rounded);
}



class ExpandedIcon extends StatelessWidget {
  const ExpandedIcon(this.icon);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxDims = constraints.normalize().biggest;
        final copy = Icon(icon.icon,
            key: key,
            size: maxDims.shortestSide,
            applyTextScaling: icon.applyTextScaling,
            color: icon.color,
            fill: icon.fill,
            grade: icon.grade,
            semanticLabel: icon.semanticLabel,
            shadows: icon.shadows,
            textDirection: icon.textDirection,
            weight: icon.weight);
        return copy;
      },
    );
  }
}

extension ExpandedIconExt on Icon {
  ExpandedIcon get expanded => ExpandedIcon(this);
}
