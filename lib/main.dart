import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:sw/config/theme.dart';
import 'package:sw/screens/startup_screen.dart';
import 'package:sw/screens/stop_watch_screen.dart';

void main() {
  // TODO: improvement - make sure Intl initialization errors are also caught
  Intl.defaultLocale = 'hu-HU';
  // note: full system localization is not set up
  initializeDateFormatting(Intl.defaultLocale, null).then(
    (value) {
      runWithErrorHandling(const StartupScreen(child: MyApp()));
    },
  );
}

/// Start running [appWidget] in a custom error zone, FlutterError setup and Riverpod Error Observer
void runWithErrorHandling(Widget appWidget) {
  // Note: using onError in itself without runZonedGuarded will not catch all manners of exceptions and errors

  // replace _dumpToOut with error remotet error reporting if needed
  Logger.root.onRecord.listen(_dumpToOut);

  /// default implementation is `presentError` which dumps the error to concole
  final currentErrorHandler = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails details) {
    if (currentErrorHandler != null) {
      currentErrorHandler(details);
    }
    Logger.root.severe(details.toString(), details.exception, details.stack);
  };

  // catch async errors as well and get notified
  runZonedGuarded(
    () {
      runApp(ProviderScope(
        observers: const [
          RiperpodErrorObserver(),
        ],
        child: appWidget,
      ));
    },
    (error, stack) {
      // To trigger this branch, one way is to throw from a build method:
      // Future.delayed(const Duration(seconds: 3), () => throw 'Ooopsie');
      Logger.root.severe('Zone error caught', error, stack);
    },
  );
}

/// Dumps events to `stdout`
///
/// Format:
///
/// ```
/// LEVEL\tLOGGER_NAME\t[UTC_TIME]: MESSAGE\n
/// Error: OPTIONAL_ERROR\n\n
/// OPTIONAL_STACKTRACE\n
/// ```
void _dumpToOut(LogRecord event) {
  stdout.writeln('${event.level}\t${event.loggerName}\t[${event.time.toUtc().toIso8601String()}]: ${event.message}');
  if (event.error != null) stdout.writeln('Error: ${event.error}');
  if (event.stackTrace != null) stdout.writeln('${event.stackTrace}');
}

class RiperpodErrorObserver extends ProviderObserver {
  const RiperpodErrorObserver();

  @override
  void providerDidFail(
      ProviderBase<Object?> provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    // These are usually handled by some kind of UI and not all are actual bugs. Nonetheless, it is a good idea to
    // stay informed and set up the error analytics software to classify these as handled. (Eager error collection)
    Logger.root.info('Provider failure in `${provider.name}`', error, stackTrace);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: const Locale('hu'),
      theme: appTheme(),
      home: const StopWatchScreen(),
    );
  }
}
