import 'package:flutter/material.dart';
import 'package:flutter_travel_test/pages/navigationPages/bar_item_page.dart';
import 'package:flutter_travel_test/pages/navigationPages/profile_item_page.dart';
import 'package:flutter_travel_test/pages/navigationPages/search_item_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List bottomNavigationPages = [
    const BarItemPage(),
    const SearchItemPage(),
    const ProfileItemPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
