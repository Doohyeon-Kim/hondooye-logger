import 'package:flutter/material.dart';
import 'package:hondooye_logger/hondooye_logger.dart';
import 'package:http/http.dart' as http;

import 'theme_notifier.dart';

void main() {
  runApp(ThemeNotifier(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeNotifier.of(context)!.theme,
      builder: (BuildContext context, ThemeData themeData, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'hondooye Package Test App',
          theme: themeData,
          home: const MyHomePage(title: 'Hondooye'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uri _generateUri() {
    return Uri(
        scheme: "https",
        host: "api.agify.io",
        path: null,
        queryParameters: null,
        query: "name=dhkim");
  }

  Future<http.Response> _httpRequest({required http.Request request}) async {
    final streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Logger("Default Logger");
            Logger("You can use this for even Object ${_TestObjectPrint()}");
            Logger.warning("Warning");
            Logger.info("Info");
            Logger.debug("Debugging");
            Logger.log("log1\nlog2\nlog3\nlog4\nlog5");
            Logger.build(
                "build start\nbuilding...\nbuilding...\nbuilding...\nbuild done");
            FunLogger.heart("I Love You.");
            FunLogger.poop("Shit Code");

            Logger.exception(_HydException("Exception Message"));
            Logger.error(HydError.example());
            Logger.errorMessage("error message");

            http.Request request = http.Request("GET", _generateUri());
            request.headers.addAll({'Content-Type': 'application/json'});

            Logger.httpRequest(httpRequest: request);
            http.Response response = await _httpRequest(request: request);
            Logger.httpResponse(httpResponse: response);
            Logger.httpResponse(httpResponse: response, printHeaders: true);
          },
          child: const Text("Test"),
        ),
      ),
    );
  }
}

class _TestObjectPrint {
  final String str = "Instance";
  final int integer = 3;
}

class _HydException implements Exception {
  _HydException(this.message);

  final String? message;

  @override
  String toString() {
    return "HydException: $message";
  }
}

class HydError implements Error {
  final String? type;
  final String? message;
  final String? title;
  final String? detail;

  HydError({this.type, this.message, this.title, this.detail});

  @override
  String toString() {
    return "$type\n$message\n$title\n$detail";
  }

  @override
  StackTrace? get stackTrace => throw UnimplementedError();

  factory HydError.example(
      {String? type,
      String? message,
      String? title,
      String? detail}) = _Example;
}

class _Example extends HydError {
  _Example({String? type, String? message, String? title, String? detail})
      : super(
            type: type ?? "TEST_ERROR",
            message: message ?? 'Error occurred',
            title: title ?? 'Error Title',
            detail: detail ?? 'Error Message');
}
