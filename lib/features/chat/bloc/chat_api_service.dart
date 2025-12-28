import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatApiService {
  final String _url = "https://dummyjson.com/comments";

  Future<List<Map<String, String>>> fetchSenderMessages() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load chat messages');
    }

    final data = json.decode(response.body);

    return (data['comments'] as List).map<Map<String, String>>((comment) {
      return {
        'message': comment['body'],
        'time': _formatTime(DateTime.now()),
      };
    }).toList();
  }

  String _formatTime(DateTime time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return "$hour:$minute $period";
  }
}
