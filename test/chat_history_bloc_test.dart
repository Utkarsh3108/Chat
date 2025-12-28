import 'package:bloc_test/bloc_test.dart';
import 'package:chat_ai/features/home/bloc/chat_history_bloc.dart';
import 'package:chat_ai/features/home/bloc/chat_history_event.dart';
import 'package:chat_ai/features/home/bloc/chat_history_state.dart';
import 'package:chat_ai/features/home/models/chat_history.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChatHistoryBloc', () {
    late ChatHistoryBloc chatHistoryBloc;

    setUp(() {
      chatHistoryBloc = ChatHistoryBloc();
    });

    tearDown(() {
      chatHistoryBloc.close();
    });

    test('initial state is ChatHistoryLoading', () {
      expect(chatHistoryBloc.state, ChatHistoryLoading());
    });

    blocTest<ChatHistoryBloc, ChatHistoryState>(
      'emits [ChatHistoryLoading, ChatHistoryLoaded] when LoadChatHistory is added',
      build: () => chatHistoryBloc,
      act: (bloc) => bloc.add(LoadChatHistory()),
      wait: const Duration(seconds: 3), // Wait for the delay
      expect: () => [
        ChatHistoryLoading(),
        isA<ChatHistoryLoaded>(),
      ],
      verify: (bloc) {
        final state = bloc.state as ChatHistoryLoaded;
        expect(state.chatHistory.length, 26); // Based on the hardcoded list
        expect(state.chatHistory.first.userName, 'Emma Wilson');
      },
    );

    blocTest<ChatHistoryBloc, ChatHistoryState>(
      'emits [ChatHistoryLoaded] with new chat when AddChatHistory is added',
      build: () => chatHistoryBloc,
      seed: () => ChatHistoryLoaded([]), // Start with empty list
      act: (bloc) => bloc.add(AddChatHistory(
        ChatHistory(
          userName: 'Test User',
          lastMessage: 'Test message',
          status: 'online',
          newMessages: 1,
        ),
      )),
      expect: () => [
        isA<ChatHistoryLoaded>(),
      ],
      verify: (bloc) {
        final state = bloc.state as ChatHistoryLoaded;
        expect(state.chatHistory.last.userName, 'Test User');
      },
    );
  });
}