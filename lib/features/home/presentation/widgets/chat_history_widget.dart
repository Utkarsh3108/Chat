import 'package:flutter/material.dart';

class ChatHistoryWidget extends StatelessWidget {
  const ChatHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder content
    return ListView.builder(
      key: const PageStorageKey('chat_history_list'),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.chat)),
          title: Text('Chat ${index + 1}'),
          subtitle: const Text('Last message preview...'),
          trailing: const Text('12:30 PM'),
        );
      },
    );
  }
}
