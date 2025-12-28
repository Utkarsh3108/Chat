import 'package:equatable/equatable.dart';
import '../models/chat_history.dart';

abstract class ChatHistoryState extends Equatable {
  const ChatHistoryState();

  @override
  List<Object> get props => [];
}

class ChatHistoryLoading extends ChatHistoryState {}

class ChatHistoryLoaded extends ChatHistoryState {
  final List<ChatHistory> chatHistory;
  const ChatHistoryLoaded(this.chatHistory);

  @override
  List<Object> get props => [chatHistory];
}

class ChatHistoryError extends ChatHistoryState {
  final String errorMessage;

  const ChatHistoryError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
