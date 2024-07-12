import 'package:flutter/material.dart';

sealed class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.icon, this.onPressed});

  const factory ActionButton.lap({VoidCallback? onPressed}) = LapTimerButton;

  const factory ActionButton.pause({VoidCallback? onPressed}) = PauseTimerButton;

  const factory ActionButton.start({VoidCallback? onPressed}) = StartTimerButton;

  const factory ActionButton.reset({VoidCallback? onPressed}) = ResetTimerButton;

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(onPressed: onPressed, icon: Icon(icon).expanded);
  }
}

final class StartTimerButton extends ActionButton {
  const StartTimerButton({super.key, super.onPressed}) : super(icon: Icons.play_arrow_rounded);
}

final class ResetTimerButton extends ActionButton {
  const ResetTimerButton({super.key, super.onPressed}) : super(icon: Icons.stop_rounded);
}

final class PauseTimerButton extends ActionButton {
  const PauseTimerButton({super.key, super.onPressed}) : super(icon: Icons.pause_rounded);
}

final class LapTimerButton extends ActionButton {
  const LapTimerButton({super.key, super.onPressed}) : super(icon: Icons.access_time_rounded);
}



class ExpandedIcon extends StatelessWidget {
  const ExpandedIcon(this.icon, {super.key});

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
