import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/mini_player.dart';
import 'albums_screen.dart';
import 'home_screen.dart';
import 'playlists_screen.dart';
import 'profile_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final _screens = const [
    HomeScreen(),
    AlbumsScreen(),
    PlaylistsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        color: AppColors.background,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_currentIndex == 0) const MiniPlayer(),
            BottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
          ],
        ),
      ),
    );
  }
}
