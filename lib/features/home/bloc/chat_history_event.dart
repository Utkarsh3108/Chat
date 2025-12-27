import 'package:chat_ai/features/home/models/chat_history.dart';
import 'package:equatable/equatable.dart';


abstract class ChatHistoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadChatHistory extends ChatHistoryEvent {}

class AddChatHistory extends ChatHistoryEvent {
  final ChatHistory chatHistory;

  AddChatHistory(this.chatHistory);

  @override
  List<Object?> get props => [chatHistory];
}
