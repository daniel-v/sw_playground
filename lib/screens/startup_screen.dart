import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'startup_screen.g.dart';

/// Screen initially presented to the user while the application starts up
///
/// This is shown after the Splash screen and before the first "real" screen is show.
final class StartupScreen extends ConsumerWidget {
  const StartupScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final starting = ref.watch(appStartupProvider);
    return switch (starting) {
      AsyncLoading() => const _StartupLoading(),
      AsyncError(error: _, stackTrace: _) => const _StartupError(), // some kind of error happened during startup
      _ => child, // app successfully started
    };
  }
}

class _StartupLoading extends StatelessWidget {
  const _StartupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          color: Colors.white,
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hamsters are working to load StopWatch',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                // TODO: cute animation about hamster coach looking for their stopwatch
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StartupError extends StatelessWidget {
  const _StartupError({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          color: Colors.white,
          child: const Center(
            child: Text(
              'Ooops, something went terribly wrong and we are sorry! '
              'The developers have been poked to figure this out and fix it for you.',
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

/// Provider to initialize application
@riverpod
Future<void> appStartup(AppStartupRef ref) async {
  // TODO: save counter state to persistent storage and restore it in case the app would crash/killed by OS
  return;
}
