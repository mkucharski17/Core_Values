import 'package:core_values/ui/core_value/core_value_screen.dart';
import 'package:core_values/ui/core_value_list/all_values_list/core_values_list_screen.dart';
import 'package:core_values/ui/core_value_list/favourites_list/favourites_list_screen.dart';
import 'package:core_values/ui/home_scrren/bottom_bar.dart';
import 'package:core_values/ui/home_scrren/home_screen_fab.dart';
import 'package:core_values/ui/home_scrren/top_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex;
  final List<Widget> children = [
    CoreValueListScreen(),
    CoreValueScreen(),
    FavouritesListScreen()
  ];


  @override
  void initState() {
    super.initState();
    currentTabIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
        floatingActionButton: HomeScreenFAB(),
        appBar: TopBar(
          currentTabIndex: currentTabIndex,
          onTap: _navigateToValueScreen,
        ),
        bottomNavigationBar: HomeScreenBottomBar(
          onPressed: _navigate,
        ),
        body: children[currentTabIndex]);
  }

  void _navigateToValueScreen() {
    _navigate(1);
  }

  void _navigate(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

}
