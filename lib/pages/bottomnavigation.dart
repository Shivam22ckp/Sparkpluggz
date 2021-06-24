import 'package:flutter/material.dart';
import 'package:sparkplugzapp/home.dart';
import 'package:sparkplugzapp/pages/addcart.dart';

import 'package:sparkplugzapp/pages/profilepage.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentTabIndex = 0;
  late List<Widget> pages;

  late Widget currentPage;

  late Home homepage;

  late Profilepage getProfilePage;
  late SeeCart newCart;

  @override
  void initState() {
    super.initState();

    homepage = Home();

    getProfilePage = Profilepage();
    newCart = SeeCart();
    pages = [homepage, newCart, getProfilePage];
    currentPage = homepage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Orders",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: currentPage,
    );
  }
}
