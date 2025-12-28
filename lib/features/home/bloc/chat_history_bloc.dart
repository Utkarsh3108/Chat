import 'package:chat_ai/features/home/models/chat_history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_history_event.dart';
import 'chat_history_state.dart';

class ChatHistoryBloc extends Bloc<ChatHistoryEvent, ChatHistoryState> {
  ChatHistoryBloc() : super(ChatHistoryLoading()) {
    on<LoadChatHistory>(_onLoadChatHistory);
    on<AddChatHistory>(_onAddChatHistory);
  }

  Future<void> _onLoadChatHistory(
    LoadChatHistory event,
    Emitter<ChatHistoryState> emit,
  ) async {
    try {
      emit(ChatHistoryLoading());

      await Future.delayed(const Duration(seconds: 2));

      final chatHistory = [
        ChatHistory(
          userName: 'Emma Wilson',
          lastMessage: 'Hey, how\'s it going?',
          status: 'online',
          newMessages: 2,
        ),
        ChatHistory(
          userName: 'Cameron Perez',
          lastMessage: 'Let\'s catch up soon!',
          status: '5 min ago',
          newMessages: 1,
        ),
        ChatHistory(
          userName: 'Emily Johnson',
          lastMessage: 'See you soon!',
          status: '12 min ago',
          newMessages: 0,
        ),
        ChatHistory(
          userName: 'Brayden Fleming',
          lastMessage: 'Happy to see you!',
          status: 'online',
          newMessages: 3,
        ),
        ChatHistory(
          userName: 'James Davis',
          lastMessage: 'I’ll call you back.',
          status: '8 min ago',
          newMessages: 0,
        ),
        ChatHistory(
          userName: 'Luke Cooper',
          lastMessage: 'Are you free right now?',
          status: 'online',
          newMessages: 2,
        ),
        ChatHistory(
          userName: 'Jace Smith',
          lastMessage: 'Meeting went well.',
          status: '15 min ago',
          newMessages: 0,
        ),
        ChatHistory(
          userName: 'Nora Mills',
          lastMessage: 'Just finished work!',
          status: 'online',
          newMessages: 1,
        ),
        ChatHistory(
          userName: 'Mateo Bennett',
          lastMessage: 'On my way.',
          status: '3 min ago',
          newMessages: 1,
        ),
        ChatHistory(
          userName: 'Scarlett Bowman',
          lastMessage: 'Can you check this?',
          status: 'online',
          newMessages: 3,
        ),
        ChatHistory(
          userName: 'Hunter Gordon',
          lastMessage: 'Thanks!',
          status: '10 min ago',
          newMessages: 0,
        ),
        ChatHistory(
          userName: 'Jonathan Pierce',
          lastMessage: 'Let’s talk later.',
          status: 'online',
          newMessages: 2,
        ),
        ChatHistory(
          userName: 'Evelyn Sanchez',
          lastMessage: 'Sounds good 😊',
          status: 'online',
          newMessages: 4,
        ),
        ChatHistory(
          userName: 'Vivian Carter',
          lastMessage: 'I sent the file.',
          status: '7 min ago',
          newMessages: 0,
        ),
        ChatHistory(
          userName: 'Nicholas Edwards',
          lastMessage: 'Where are you?',
          status: 'online',
          newMessages: 1,
        ),
        ChatHistory(
          userName: 'Nora Russell',
          lastMessage: 'See you soon.',
          status: '12 min ago',
          newMessages: 0,
        ),
        ChatHistory(
          userName: 'Nova Cooper',
          lastMessage: 'Let’s do it!',
          status: 'online',
          newMessages: 2,
        ),
        ChatHistory(
          userName: 'Lucas Gray',
          lastMessage: 'Got it 👍',
          status: 'online',
          newMessages: 1,
        ),
        ChatHistory(
          userName: 'Mia Miller',
          lastMessage: 'Almost there.',
          status: '5 min ago',
          newMessages: 1,
        ),
        ChatHistory(
          userName: 'Jaxon Barnes',
          lastMessage: 'Check your inbox.',
          status: 'online',
          newMessages: 3,
        ),
        ChatHistory(
          userName: 'Claire Foster',
          lastMessage: 'That works for me.',
          status: 'online',
          newMessages: 2,
        ),
        ChatHistory(
          userName: 'Ethan Fletcher',
          lastMessage: 'Let me know.',
          status: 'online',
          newMessages: 0,
        ),
        ChatHistory(
          userName: 'Nathan Dixon',
          lastMessage: 'I’ll update you.',
          status: '12 min ago',
          newMessages: 0,
        ),
        ChatHistory(
          userName: 'Xavier Wright',
          lastMessage: 'Can we talk?',
          status: 'online',
          newMessages: 2,
        ),
        ChatHistory(
          userName: 'Luna Perez',
          lastMessage: 'See you there!',
          status: '5 min ago',
          newMessages: 1,
        ),
        ChatHistory(
          userName: 'Brayden Fleming',
          lastMessage: 'Happy to see you!',
          status: 'online',
          newMessages: 3,
        ),
      ];

      emit(ChatHistoryLoaded(chatHistory));
    } catch (e) {
      emit(ChatHistoryError(e.toString()));
    }
  }

  Future<void> _onAddChatHistory(
    AddChatHistory event,
    Emitter<ChatHistoryState> emit,
  ) async {
    final chatHistory = List<ChatHistory>.from(
      (state as ChatHistoryLoaded).chatHistory,
    );
    chatHistory.add(event.chatHistory);

    emit(ChatHistoryLoaded(chatHistory));
  }
}
