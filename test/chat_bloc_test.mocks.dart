
import 'dart:async' as _i3;

import 'package:chat_ai/features/chat/bloc/chat_api_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

class MockChatApiService extends _i1.Mock implements _i2.ChatApiService {
  MockChatApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<Map<String, String>>> fetchMessages() =>
      (super.noSuchMethod(
            Invocation.method(#fetchMessages, []),
            returnValue: _i3.Future<List<Map<String, String>>>.value(
              <Map<String, String>>[],
            ),
          )
          as _i3.Future<List<Map<String, String>>>);
}
