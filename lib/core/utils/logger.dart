import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger =
      Logger(printer: PrettyPrinter(printEmojis: true, lineLength: 100));

  static void info(dynamic message) {
    if (!kDebugMode) {
      return;
    }
    _logger.i(message);
  }

  static void warn(dynamic message) {
    if (!kDebugMode) {
      return;
    }
    _logger.w(message);
  }

  static void error(dynamic message) {
    if (!kDebugMode) {
      return;
    }
    _logger.e(message);
  }
}
