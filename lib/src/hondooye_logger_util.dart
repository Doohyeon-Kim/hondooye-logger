// ignore_for_file: library_private_types_in_public_api

import 'package:logger/logger.dart';

class LoggerUtil {
  LoggerUtil._();

  static void createLogger(String emoji, dynamic message, {int? methodCount}) {
    message = message.toString();
    List<String> buffer = [];
    for (String messageLine in message.split('\n')) {
      buffer.add("$emoji $messageLine");
    }
    Logger(printer: PrettyPrinter(methodCount: methodCount ??= 0, printEmojis: false)).d(buffer.join("\n"));
  }

  static _Emojis emojis = _Emojis();
}

class _Emojis {
  String log = '🪵';
  String message = '💬';
  String info = '💡';
  String debug = '🐛';
  String warning = '⚠️';
  String error = '🛑';
  String exception = '🚫';
  String build = '🏗';
  String send = '➡️';
  String receive = '⬅️';
  String robot = '🤖';
  String heart = '❤️';
  String poop = '💩️';
}
