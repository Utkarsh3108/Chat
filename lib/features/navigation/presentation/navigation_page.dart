import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import '../bloc/navigation_state.dart';

import '../../home/presentation/home_page.dart';
import '../../offers/presentation/offer_page.dart';
import '../../settings/presentation/settings_page.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  static const List<Widget> _pages = [HomePage(), OffersPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _pages[state.currentIndex],
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min, // so it wraps content
            children: [
              const Divider(
                thickness: 1,
                color:  Color.fromARGB(255, 245, 245, 245), // color of the divider
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  currentIndex: state.currentIndex,
                  onTap: (index) {
                    context.read<NavigationBloc>().add(
                      NavigationTabChanged(index),
                    );
                  },
                  selectedItemColor: Colors.blueAccent,
                  iconSize: 28,
                  selectedFontSize: 14,
                  unselectedFontSize: 12,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat_outlined),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.local_offer_outlined),
                      label: 'Offers',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined),
                      label: 'Settings',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
