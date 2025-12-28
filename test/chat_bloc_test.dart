import 'package:bloc_test/bloc_test.dart';
import 'package:chat_ai/features/chat/bloc/chat_api_service.dart';
import 'package:chat_ai/features/chat/bloc/chat_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'chat_bloc_test.mocks.dart';

@GenerateMocks([ChatApiService])
void main() {
  group('ChatBloc', () {
    late ChatBloc chatBloc;
    late MockChatApiService mockChatApiService;

    setUp(() {
      mockChatApiService = MockChatApiService();
      chatBloc = ChatBloc(chatApiService: mockChatApiService);
    });

    tearDown(() {
      chatBloc.close();
    });

    test('initial state is ChatLoading', () {
      expect(chatBloc.state, ChatLoading());
    });

    blocTest<ChatBloc, ChatState>(
      'emits [ChatLoading, ChatLoaded] when LoadChatMessages succeeds',
      build: () {
        when(mockChatApiService.fetchMessages()).thenAnswer(
          (_) async => [
            {'message': 'Hello', 'user': 'User1', 'time': '12:00 PM'},
            {'message': 'Hi', 'user': 'User2', 'time': '12:01 PM'},
          ],
        );
        return chatBloc;
      },
      act: (bloc) => bloc.add(LoadChatMessages()),
      expect: () => [
        ChatLoading(),
        ChatLoaded(messages: [
          {'message': 'Hello', 'user': 'User1', 'time': '12:00 PM'},
          {'message': 'Hi', 'user': 'User2', 'time': '12:01 PM'},
        ]),
      ],
    );

    blocTest<ChatBloc, ChatState>(
      'emits [ChatLoading, ChatError] when LoadChatMessages fails',
      build: () {
        when(mockChatApiService.fetchMessages()).thenThrow(Exception('API Error'));
        return chatBloc;
      },
      act: (bloc) => bloc.add(LoadChatMessages()),
      expect: () => [
        ChatLoading(),
        ChatError(error: 'Exception: API Error'),
      ],
    );
  });
}