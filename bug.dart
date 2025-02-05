```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Properly handle the JSON response
      final jsonData = jsonDecode(response.body);
      // Access data from jsonData
    } else {
      // Handle errors properly
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions, don't just print
    print('Error fetching data: $e');
    //Consider rethrowing the exception if needed for higher level handling
    rethrow;
  }
}
```