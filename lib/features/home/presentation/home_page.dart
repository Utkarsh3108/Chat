import 'package:chat_ai/features/home/presentation/widgets/chat_history_widget.dart';
import 'package:chat_ai/features/home/presentation/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/capsule_toggle.dart';
import '../bloc/home_toggle_bloc.dart';
import '../bloc/home_toggle_event.dart';
import '../bloc/home_toggle_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeToggleBloc(),
      child: BlocBuilder<HomeToggleBloc, HomeToggleState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 70,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0, // top & bottom
                    horizontal: 14.0, // left & right
                  ),
                  child: CapsuleToggle(
                    selectedIndex: state.selectedIndex,
                    onChanged: (index) {
                      context.read<HomeToggleBloc>().add(
                        HomeToggleChanged(index),
                      );
                    },
                  ),
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 245, 245, 245),
                  height: 0.1,
                ),
              ),
            ),
            body: PageStorage(
              bucket: PageStorageBucket(),
              child: IndexedStack(
                index: state.selectedIndex,
                children: const [
                  UsersWidget(
                    key: PageStorageKey('users_list'),
                  ),
                  ChatHistoryWidget(
                    key: PageStorageKey('chat_history_list'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
