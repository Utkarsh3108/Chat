import 'package:flutter/material.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder content
    return ListView.builder(
      key: const PageStorageKey('users_list'),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text('User ${index + 1}'),
          subtitle: const Text('Online'),
        );
      },
    );
  }
}
