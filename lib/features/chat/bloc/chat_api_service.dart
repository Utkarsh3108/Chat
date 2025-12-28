import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatApiService {
  final String _url = "https://dummyjson.com/comments";

  Future<List<Map<String, String>>> fetchMessages() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        List<Map<String, String>> messages = [];
        for (var comment in data['comments']) {
          messages.add({
            'message': comment['body'],
            'user': comment['user']['username'],
            'time': "12:00 PM",
          });
        }
        return messages;
      } else {
        throw Exception('Failed to load chat messages');
      }
    } catch (e) {
      throw Exception('Failed to load chat messages: $e');
    }
  }
}
