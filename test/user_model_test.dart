import 'package:chat_ai/features/home/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User Model', () {
    test('User should be equal when properties are the same', () {
      const user1 = User(name: 'John Doe', status: 'online');
      const user2 = User(name: 'John Doe', status: 'online');
      const user3 = User(name: 'Jane Doe', status: 'online');

      expect(user1, equals(user2));
      expect(user1, isNot(equals(user3)));
    });

    test('User props should return correct list', () {
      const user = User(name: 'John Doe', status: 'online');
      expect(user.props, ['John Doe', 'online']);
    });
  });
}