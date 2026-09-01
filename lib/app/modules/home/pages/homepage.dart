import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/modules/dashboard/pages/dashboard_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentPage = 0;

  final List<IconData> _iconList = const [
    Icons.home_outlined,
    Icons.star_outline,
    Icons.menu_book_outlined,
    Icons.location_on_outlined,
    Icons.person_outline,
  ];

  final List<Widget> _pages = const [
    DashboardPage(),
    Scaffold(body: Center(child: Text("Marcos"))),
    Scaffold(body: Center(child: Text("Orientações"))),
    Scaffold(body: Center(child: Text("Locais / Agenda"))),
    Scaffold(body: Center(child: Text("Perfil"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _currentPage,
        children: _pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        iconSize: 28,
        activeIndex: _currentPage,
        height: 72,
        splashSpeedInMilliseconds: 300,
        gapLocation: GapLocation.none,
        activeColor: AppColors.primaryButton,
        inactiveColor: AppColors.textSecondary,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
