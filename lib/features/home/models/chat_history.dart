import 'package:equatable/equatable.dart';

class ChatHistory extends Equatable {
  final String userName;
  final String lastMessage;
  final String status;
  final int newMessages;

  const ChatHistory({
    required this.userName,
    required this.lastMessage,
    required this.status,
    required this.newMessages,
  });

  @override
  List<Object> get props => [userName, lastMessage, status, newMessages];
}
