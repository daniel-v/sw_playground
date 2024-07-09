import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sw/screens/stop_watch_screen.dart';

void main() {
  // FIXME: error handling

  // note: full system localization is not set up
  Intl.defaultLocale = 'hu-HU';
  initializeDateFormatting(Intl.defaultLocale, null).then(
    (value) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // not setting up full localization support for this app
      // supportedLocales: const [
      //   Locale('hu'),
      // ],
      locale: const Locale('hu'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StopWatchScreen(),
    );
  }
}
