class ChatMockData {
  static final List<Map<String, String>> receiverMessages = [
    _msg("Hey "),
    _msg("How can I help you?"),
    _msg("That sounds interesting"),
    _msg("Can you explain more?"),
    _msg("Got it "),
    _msg("Makes sense"),
    _msg("Sure"),
    _msg("Absolutely"),
    _msg("Okay cool"),
    _msg("Sounds good"),
    _msg("Nice idea "),
    _msg("Thanks for sharing"),
    _msg("Understood"),
    _msg("Hmm "),
    _msg("Let’s do it"),
    _msg("Works for me"),
    _msg("Alright"),
    _msg("No worries"),
    _msg("Gotcha"),
    _msg("Perfect!"),
    _msg("Sure thing"),
    _msg("I agree"),
  ];

  static Map<String, String> _msg(String text) {
    final now = DateTime.now();
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';

    return {
      'message': text,
      'time': "$hour:$minute $period",
    };
  }
}
