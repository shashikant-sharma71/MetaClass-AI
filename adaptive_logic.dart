import 'dart:convert';
import 'package:http/http.dart' as http;

String getLevel(int score) {
  if (score < 40)
    return 'easy';
  else if (score < 75)
    return 'medium';
  else
    return 'hard';
}

Future<void> sendToBackend(int score, String topic) async {
  String level = getLevel(score);
  final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts'); // Replace with real URL later

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'topic': topic,
        'level': level,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('✅ Response from backend: ${response.body}');
    } else {
      print('❌ Failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('⚠️ Error sending request: $e');
  }
}
