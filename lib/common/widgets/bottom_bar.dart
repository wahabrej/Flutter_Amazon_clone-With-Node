import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/account/screens/account_screen.dart';
import 'package:amazon_clone/features/auth/home/screen/home_screen.dart';
import 'package:badges/badges.dart' as badges; // Import the badges package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "actual_home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBarBorderwidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text("Cart"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 25,
        onTap: (int index) {
          setState(() {
            _page = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderwidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderwidth,
                  ),
                ),
              ),
              child: const Icon(Icons.person_2_rounded),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderwidth,
                  ),
                ),
              ),
              child: const badges.Badge(
                badgeContent: const Text(
                  '3', // Example badge content (number of items)
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
