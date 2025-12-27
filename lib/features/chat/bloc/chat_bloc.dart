import 'package:chat_ai/features/chat/bloc/chat_api_service';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ChatEvent {}

class LoadChatMessages extends ChatEvent {}

abstract class ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Map<String, String>> messages;

  ChatLoaded({required this.messages});
}

class ChatError extends ChatState {
  final String error;

  ChatError({required this.error});
}

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatApiService chatApiService;

  ChatBloc({required this.chatApiService}) : super(ChatLoading()) {
    on<LoadChatMessages>(_onLoadChatMessages);
  }

  Future<void> _onLoadChatMessages(
    LoadChatMessages event,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatLoading()); // Emit loading state
    try {
      final messages = await chatApiService.fetchMessages();
      emit(ChatLoaded(messages: messages)); // Emit loaded state
    } catch (e) {
      emit(ChatError(error: e.toString())); // Emit error state in case of failure
    }
  }
}
