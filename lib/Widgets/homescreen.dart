import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welding_system/Providers/screenIndexProvider.dart';
import 'package:welding_system/Screen/home_page.dart';
import 'package:welding_system/Screen/laserParamter_page.dart';
import 'package:welding_system/Screen/galvanometer_page.dart';
import 'package:welding_system/Screen/wireFeeder_page.dart';

class HomeScreen extends StatelessWidget {
  List<dynamic> screens = [
    HomePage(),
    LaserParameterPage(),
    GalvanometerParameter(),
    WireFeederPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<screenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        elevation: 1.5,
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
        currentIndex: currentScreenIndex,
        onTap: (value) => _screenindexprovider.updateScreenIndex(value),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home,
                color: (currentScreenIndex == 0) ? Colors.white : CupertinoColors.systemGrey2),
          ),
          BottomNavigationBarItem(
            label: 'Laser',
            icon: Icon(Icons.light_mode,
                color: (currentScreenIndex == 1) ? Colors.white : CupertinoColors.systemGrey2),
          ),
          BottomNavigationBarItem(
            label: 'Galvanometer',
            icon: Icon(Icons.electric_meter,
                color: (currentScreenIndex == 2) ? Colors.white : CupertinoColors.systemGrey2),
          ),
          BottomNavigationBarItem(
            label: 'Wire',
            icon: Icon(Icons.cable,
                color: (currentScreenIndex == 3) ? Colors.white : CupertinoColors.systemGrey2),
          ),
        ],
      ),
      body: screens[currentScreenIndex],
    );
  }
}
