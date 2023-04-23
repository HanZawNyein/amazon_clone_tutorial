import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../features/account/screens/account_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";

  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    // const Center(
    //   child: Text("Account Page"),
    // ),
    const Center(
      child: Text("Cart Page"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updatePage,
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28.0,
        items: [
          //HOME Page
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: bottomBarBorderWidth))),
                child: Icon(Icons.home_outlined),
              ),
              label: ""),

          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: bottomBarBorderWidth))),
                child: Icon(Icons.person_outline_outlined),
              ),
              label: ""),
          //HOME Page
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 2
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: bottomBarBorderWidth))),
                child: badges.Badge(
                  badgeContent: Text('3'),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.white,
                  ),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ),
              label: ""),
        ],
      ),
    );
  }
}
