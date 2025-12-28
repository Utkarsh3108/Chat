class ChatMessage {
  final String text;
  final DateTime timestamp;
  final bool isSender;

  ChatMessage({
    required this.text,
    required this.timestamp,
    required this.isSender,
  });
}
