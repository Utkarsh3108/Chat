import 'package:chat_ai/features/home/models/chat_history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_history_event.dart';
import 'chat_history_state.dart';


class ChatHistoryBloc extends Bloc<ChatHistoryEvent, ChatHistoryState> {
  ChatHistoryBloc() : super(ChatHistoryLoading()) { // Initially, set to loading state
    on<LoadChatHistory>(_onLoadChatHistory);
    on<AddChatHistory>(_onAddChatHistory);
  }

  Future<void> _onLoadChatHistory(LoadChatHistory event, Emitter<ChatHistoryState> emit) async {
    try {
      emit(ChatHistoryLoading());  // Emit loading state before fetching data

      // Simulate a delay for loading data (you can replace it with actual data fetching)
      await Future.delayed(const Duration(seconds: 2));

      final chatHistory = [
        ChatHistory(userName: 'Emma Wilson', lastMessage: 'Hey, how\'s it going?', status: 'online', newMessages: 2),
        ChatHistory(userName: 'Cameron Perez', lastMessage: 'Let\'s catch up soon!', status: '5 min ago', newMessages: 1),
        ChatHistory(userName: 'Emily Johnson', lastMessage: 'See you soon!', status: '12 min ago', newMessages: 0),
        ChatHistory(userName: 'Brayden Fleming', lastMessage: 'Happy to see you!', status: 'online', newMessages: 3),
      ];

      emit(ChatHistoryLoaded(chatHistory));  // Emit loaded state with data
    } catch (e) {
      emit(ChatHistoryError(e.toString()));  // Emit error if something fails
    }
  }

  Future<void> _onAddChatHistory(AddChatHistory event, Emitter<ChatHistoryState> emit) async {
    // Here you would typically add the new chat to the list (e.g., through an API or database)
    final chatHistory = List<ChatHistory>.from((state as ChatHistoryLoaded).chatHistory);
    chatHistory.add(event.chatHistory);

    emit(ChatHistoryLoaded(chatHistory));  // Emit loaded state with updated list
  }
}
