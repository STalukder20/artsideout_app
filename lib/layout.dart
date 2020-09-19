import 'package:artsideout_app/components/common/SpeedDialMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Pages
import 'package:artsideout_app/pages/home/HomePage.dart';
import 'package:artsideout_app/components/common/Placeholder.dart';
import 'package:artsideout_app/pages/art/MasterArtPage.dart';
import 'package:artsideout_app/pages/activity/MasterActivityPage.dart';

import 'components/common/PlatformSvg.dart';

class Layout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LayoutState();
  }
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 1;

  final List<NavigationItem> _barItems = [
    NavigationItem(Icon(Icons.map, color: Colors.black), Text("Map"),
        PlaceholderWidget(Colors.deepOrange)),
    NavigationItem(
        Icon(Icons.home, color: Colors.black), Text("Home"), HomePage()),
    NavigationItem(Icon(Icons.search, color: Colors.black), Text("Search"),
        PlaceholderWidget(Colors.green)),
    NavigationItem(
        Icon(Icons.palette, color: Colors.black), Text("Art"), MasterArtPage()),
    NavigationItem(Icon(Icons.event, color: Colors.black), Text("Activities"),
        MasterActivityPage()),
    NavigationItem(
        Icon(
          Icons.bookmark,
          color: Colors.black,
        ),
        Text("Saved"),
        MasterArtPage()),
  ];

  @override
  Widget build(BuildContext context) {
    Widget _buildTabletLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      return Stack(children: <Widget>[
        PlatformSvg.asset(
          "assets/icons/asobg3.svg",
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            body: _barItems[_currentIndex].page)
      ]);
    }

    Widget _buildMobileLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
      return Stack(children: <Widget>[
        PlatformSvg.asset(
          "assets/icons/asobg3.svg",
          fit: BoxFit.fitHeight,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _barItems[_currentIndex].page,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
              SpeedDialMenu(onTabTapped: onTabTapped, barItems: _barItems),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 8.0, 8.0, 12.0),
                  child: IconButton(
                    onPressed: () {
                      onTabTapped(0);
                    },
                    icon: Icon(
                      Icons.map,
                      size: 29.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 50.0, 12.0),
                  child: IconButton(
                    onPressed: () {
                      onTabTapped(2);
                    },
                    icon: Icon(
                      Icons.search,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]);
    }

    bool _isLargeScreen = false;
    if (MediaQuery.of(context).size.width > 600) {
      _isLargeScreen = true;
    } else {
      _isLargeScreen = false;
    }
    return _isLargeScreen ? _buildTabletLayout() : _buildMobileLayout();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class NavigationItem {
  Icon icon;
  Text title;
  Widget page;

  NavigationItem(this.icon, this.title, this.page);
}
