import 'package:intl/intl.dart';

String timerDefaultFormatterDelegate(int ms) {
  final duration = Duration(milliseconds: ms);
  final buffer = StringBuffer();
  if (duration.inDays > 0) {
    buffer.write('${duration.inDays.format}:');
  }
  late DateFormat dateFormat;
  if (duration.inHours > 0) {
    dateFormat = DateFormat('HH:mm:ss');
  } else {
    dateFormat = DateFormat('mm:ss');
  }
  final date = DateTime(0).add(duration);
  buffer
    ..write(dateFormat.format(date))
    ..write('.${(ms % 1000).toString().padLeft(3, '0')}');
  return buffer.toString();
}

extension _FormatExtension on int {
  String get format => '$this'.padLeft(2, '0');
}
