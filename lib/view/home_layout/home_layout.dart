import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/view/home_screen/home_screen.dart';
import 'package:restaurant/view/profile_screen/profile_screen.dart';

import '../delivery_screen/delivery_screen.dart';

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
    const DeliveryScreen(),
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
      extendBody: true,
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, -1),
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
            iconSize: 30,
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
