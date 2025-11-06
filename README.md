# hondooye_logger

A useful and beautiful logger package for Flutter with emoji support and HTTP request/response logging.

## Features

- 🪵 Simple and intuitive logging API
- 💬 Multiple log levels (log, debug, info, warning, error, exception)
- 🎨 Emoji-enhanced log messages for better readability
- 🌐 HTTP request/response logging support
- 🏗️ Build process logging
- ❤️ Fun logger options (heart, robot, poop)

## Getting started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  hondooye_logger: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Logging

```dart
import 'package:hondooye_logger/hondooye_logger.dart';

// Default logger
Logger("Default Logger");

// Debug logging
Logger.debug("Debugging message");

// Info logging
Logger.info("Information message");

// Warning logging
Logger.warning("Warning message");

// Error logging
Logger.error(Error("Error occurred"));

// Exception logging
Logger.exception(Exception("Exception occurred"));
```

### HTTP Request/Response Logging

```dart
import 'package:http/http.dart' as http;

// Log HTTP request
http.Request request = http.Request("GET", Uri.parse("https://api.example.com"));
Logger.httpRequest(httpRequest: request);

// Log HTTP response
http.Response response = await http.get(Uri.parse("https://api.example.com"));
Logger.httpResponse(httpResponse: response);

// Log HTTP response with headers
Logger.httpResponse(httpResponse: response, printHeaders: true);
```

### Multipart Request Logging

```dart
var request = http.MultipartRequest('POST', Uri.parse('https://api.example.com'));
Logger.multipartRequest(multipartRequest: request);
```

### Fun Loggers

```dart
FunLogger.heart("I Love You.");
FunLogger.robot("Robot message");
FunLogger.poop("Shit Code");
```

### Build Process Logging

```dart
Logger.build("build start\nbuilding...\nbuild done");
```

## Additional information

- Repository: https://github.com/Doohyeon-Kim/hondooye-logger
- License: MIT
