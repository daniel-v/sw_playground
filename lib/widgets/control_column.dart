import 'package:flutter/material.dart';
import 'package:sw/widgets/buttons.dart';

enum ControlColumnVariant {
  idle,
  running,
  paused,
}

/// Column of Stop watch controls
///
/// Note: make sure to properly key this Widget, otherwise animations between different variants might not function
/// properly.
///
/// Default animation details can be overridden by using [ControlColumnProvider] and [ControlColumnConfig].
final class ControlColumn extends StatelessWidget {
  const ControlColumn({super.key, required this.variant, this.onStart, this.onLap, this.onPause, this.onStop});

  final ControlColumnVariant variant;
  final VoidCallback? onStart;
  final VoidCallback? onLap;
  final VoidCallback? onPause;
  final VoidCallback? onStop;

  @override
  Widget build(BuildContext context) {
    final colVariant = switch (variant) {
      ControlColumnVariant.idle => _IdleColumn(onStart: onStart, key: const ValueKey('1')),
      ControlColumnVariant.running => _RunningColumn(onPause: onPause, onLap: onLap, key: const ValueKey('2')),
      ControlColumnVariant.paused => _PausedColumn(onStart: onStart, onLap: onLap, onStop: onStop, key: const ValueKey('3'))
    };

    final config = ControlColumnProvider.configOf(context);

    return AnimatedSwitcher(
      duration: config.animationDuration,
      child: colVariant,
    );
  }
}

/// Provides optional configuration to [ControlColumn] to overwrite defaults
///
/// See [ControlColumnConfig] for details.
final class ControlColumnProvider extends InheritedWidget {
  const ControlColumnProvider({
    super.key,
    required this.config,
    required super.child,
  });

  final ControlColumnConfig config;

  static ControlColumnProvider of(BuildContext context) {
    final ControlColumnProvider? result = context.dependOnInheritedWidgetOfExactType<ControlColumnProvider>();
    assert(result != null, 'No ControlColumnConfig found in context');
    return result!;
  }

  static ControlColumnConfig configOf(BuildContext context) {
    final ControlColumnProvider? result = context.dependOnInheritedWidgetOfExactType<ControlColumnProvider>();
    return result?.config ?? const ControlColumnConfig.initial();
  }

  @override
  bool updateShouldNotify(ControlColumnProvider oldWidget) {
    return oldWidget.config != config;
  }
}

final class ControlColumnConfig {
  const ControlColumnConfig({required this.animationDuration});

  const ControlColumnConfig.initial() : animationDuration = const Duration(milliseconds: 150);

  /// Animation speed with which transition happens between different state variants of ControlColumn
  final Duration animationDuration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ControlColumnConfig && runtimeType == other.runtimeType && animationDuration == other.animationDuration;

  @override
  int get hashCode => animationDuration.hashCode;
}

final class _IdleColumn extends StatelessWidget {
  const _IdleColumn({super.key, required this.onStart});

  final VoidCallback? onStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _Large(child: ActionButton.start(onPressed: onStart)),
      ],
    );
  }
}

final class _RunningColumn extends StatelessWidget {
  const _RunningColumn({super.key, required this.onPause, required this.onLap});

  final VoidCallback? onPause;
  final VoidCallback? onLap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _Small(child: ActionButton.lap(onPressed: onLap)),
        const SizedBox(height: 15),
        _Large(child: ActionButton.pause(onPressed: onPause)),
      ],
    );
  }
}

final class _PausedColumn extends StatelessWidget {
  const _PausedColumn({super.key, required this.onStart, required this.onLap, required this.onStop});

  final VoidCallback? onStart;
  final VoidCallback? onLap;
  final VoidCallback? onStop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _Small(child: ActionButton.start(onPressed: onStart)),
        const SizedBox(height: 15),
        _Small(child: ActionButton.lap(onPressed: onLap)),
        const SizedBox(height: 15),
        _Large(child: ActionButton.reset(onPressed: onStop)),
      ],
    );
  }
}

class _AnimatedActionButton extends StatefulWidget {
  const _AnimatedActionButton({super.key, required this.child});

  final Widget child;

  @override
  State<_AnimatedActionButton> createState() => _AnimatedActionButtonState();
}

class _AnimatedActionButtonState extends State<_AnimatedActionButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 150),
    vsync: this, // this is why late is needed
  )..forward();

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  ));

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Large extends StatelessWidget {
  const _Large({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 60, height: 60, child: child);
  }
}

class _Small extends StatelessWidget {
  const _Small({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 40, height: 40, child: child);
  }
}
