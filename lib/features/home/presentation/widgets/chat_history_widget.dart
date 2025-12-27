import 'package:chat_ai/features/home/bloc/chat_history_bloc.dart';
import 'package:chat_ai/features/home/bloc/chat_history_event.dart';
import 'package:chat_ai/features/home/bloc/chat_history_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatHistoryWidget extends StatelessWidget {
  const ChatHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatHistoryBloc()..add(LoadChatHistory()), // Load initial chat history
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ChatHistoryBloc, ChatHistoryState>(
          builder: (context, state) {
            if (state is ChatHistoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChatHistoryLoaded) {
              final chatHistory = state.chatHistory;

              return ListView.builder(
                itemCount: chatHistory.length,
                itemBuilder: (context, index) {
                  final chat = chatHistory[index];
                  final initial = chat.userName.isNotEmpty ? chat.userName[0] : '?';

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                    child: Row(
                      children: [
                        // Avatar with gradient
                        Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Colors.green, Colors.greenAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              initial,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        // User name, message, and status in a Column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User name
                            Text(
                              chat.userName,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            // Last message
                            Text(
                              chat.lastMessage,
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Column for status and new messages
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Status (e.g. online, 5 min ago)
                            Text(
                              chat.status,
                              style: TextStyle(color: Colors.grey.shade400, fontSize: 14,fontWeight: FontWeight.bold),
                            ),
                           
                            // New message indicator (circular with number)
                            if (chat.newMessages > 0)
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: Text(
                                  '${chat.newMessages}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is ChatHistoryError) {
              return Center(child: Text(state.errorMessage));  // Display error message
            }

            return const Center(child: Text('Failed to load chat history.'));
          },
        ),
      ),
    );
  }
}
