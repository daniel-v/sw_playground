import 'package:flutter/material.dart';
import 'package:sw/config/consts.dart';

const onSurfaceBodyColor = Colors.black;
const primary = Color(0xFF52AE30);

ThemeData appTheme() {
  final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: primary)
      ..copyWith(
        surfaceTint: Colors.transparent,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
    scaffoldBackgroundColor: const Color(0xffeceff6),
    fontFamily: AppFont.SourceSans3.fontId,
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        fontFamily: AppFont.B612.fontId,
        fontSize: 24,
        color: Colors.green,
        letterSpacing: computeTitleLetterSpacing(24),
      ),
      subtitleTextStyle: TextStyle(
        fontSize: 14,
        color: onSurfaceBodyColor.withOpacity(0.67),

      ),
    ),
  );
  return theme;

  // final baseTheme =  const MaterialTheme(TextTheme(
  // )).light();
  //
  // var changed = baseTheme.copyWith(scaffoldBackgroundColor: );
  // return changed;
}

double computeTitleLetterSpacing(int fontSize) {
  return (3 / 40) * fontSize;
}
