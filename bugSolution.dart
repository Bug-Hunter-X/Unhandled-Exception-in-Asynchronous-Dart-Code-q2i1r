```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // Provide more context to the exception
      throw HttpException('Failed to load data: ${response.statusCode}', response.body);
    }
  } on HttpException catch (e) {
    // Handle specific HTTP exceptions
    print('HTTP Error: ${e.message} - Status Code: ${e.statusCode}');
    //Consider showing error message to user
    return null; //Or rethrow as appropriate
  } on FormatException catch (e) {
    print('JSON decoding error: $e');
    return null;
  } catch (e) {
    // Handle any other exceptions
    print('An unexpected error occurred: $e');
    return null;
  }
}

// Custom exception for HTTP errors
class HttpException implements Exception {
  final String message;
  final int statusCode; 
  final String? responseBody; //Optional parameter for additional context

  HttpException(this.message, this.statusCode, {this.responseBody});

  @override
  String toString() => 'HttpException: $message (Status Code: $statusCode)';
}
```