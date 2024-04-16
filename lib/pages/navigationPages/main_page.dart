import 'package:flutter/material.dart';
import 'package:flutter_travel_test/pages/navigationPages/bar_item_page.dart';
import 'package:flutter_travel_test/pages/navigationPages/home_item_page.dart';
import 'package:flutter_travel_test/pages/navigationPages/profile_item_page.dart';
import 'package:flutter_travel_test/pages/navigationPages/search_item_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List bottomNavigationPages = [
    const HomeItemPage(),
    const BarItemPage(),
    const SearchItemPage(),
    const ProfileItemPage(),
  ];

  int _selectedIndex = 0;

  void onBottomNavigationitemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavigationPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onBottomNavigationitemTap,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: "Bar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
