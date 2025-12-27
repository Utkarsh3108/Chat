import 'package:chat_ai/features/home/models/chat_history.dart';

abstract class ChatHistoryState {}

class ChatHistoryLoading extends ChatHistoryState {}

class ChatHistoryLoaded extends ChatHistoryState {
  final List<ChatHistory> chatHistory;

  ChatHistoryLoaded(this.chatHistory);
}

class ChatHistoryError extends ChatHistoryState {
  final String errorMessage;

  ChatHistoryError(this.errorMessage);
}
