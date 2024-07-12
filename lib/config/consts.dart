// ignore_for_file: constant_identifier_names

enum AppFont {
  B612(fontId: 'B612'),
  SourceSans3(fontId: 'SourceSans3');

  const AppFont({required this.fontId});

  final String fontId;
}
