import 'package:chat_ai/features/chat/models/chat_mock_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_api_service.dart';

abstract class ChatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadChatMessages extends ChatEvent {}

abstract class ChatState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Map<String, String>> messages;

  ChatLoaded({required this.messages});

  @override
  List<Object> get props => [messages];
}

class ChatError extends ChatState {
  final String error;

  ChatError({required this.error});

  @override
  List<Object> get props => [error];
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
    emit(ChatLoading());

    try {
    
      final senderMessages =
          await chatApiService.fetchSenderMessages();

     
      final List<Map<String, String>> mergedMessages = [];

      for (int i = 0; i < senderMessages.length; i++) {
        
        mergedMessages.add(senderMessages[i]);

      
        mergedMessages.add(
          ChatMockData.receiverMessages[
              i % ChatMockData.receiverMessages.length],
        );
      }

      emit(ChatLoaded(messages: mergedMessages));
    } catch (e) {
      emit(ChatError(error: e.toString()));
    }
  }
}
