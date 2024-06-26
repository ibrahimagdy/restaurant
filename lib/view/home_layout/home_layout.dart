import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/view/home_screen/home_screen.dart';
import 'package:restaurant/view/ongoing_screen/ongoing_screen.dart';
import 'package:restaurant/view/profile_screen/profile_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String id = 'HomeLayout';

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const OngoingScreen(),
    const ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildSvgIcon(String assetName, int index) {
    return SvgPicture.asset(
      assetName,
      color: selectedIndex == index ? primaryColor : greyColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: greyColor,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            iconSize: 32,
            selectedItemColor: primaryColor,
            unselectedItemColor: greyColor,
            type: BottomNavigationBarType.fixed,
            backgroundColor: white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: buildSvgIcon("assets/icons/ongoing_icon.svg", 1),
                label: 'ongoing',
              ),
              BottomNavigationBarItem(
                icon: buildSvgIcon("assets/icons/profile_icon.svg", 2),
                label: 'profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}