import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projeto_atual/Pages/Views/Dashboard_screen.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<IconData> icons = [
  Icons.home_outlined,
  Icons.star_outline,
  Icons.menu_book_outlined,
  Icons.location_on_outlined,
  Icons.person_outline,
];

  int page = 0;

  List<Widget> pages = [
    Dashboard(), // You can replace this with your actual pages
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[page], // Display the selected page
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        iconSize: 28,
        activeIndex: page,
        height: 80,
        splashSpeedInMilliseconds: 300,
        gapLocation: GapLocation.none,
        activeColor: const Color.fromARGB(255, 0, 190, 165),
        inactiveColor: Colors.black45,
        onTap: (int tappedIndex) {
          setState(() {
            page = tappedIndex; // Update the selected page
          });
        },
      ),
    );
  }
}