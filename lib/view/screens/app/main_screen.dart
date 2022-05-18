import 'package:flutter/material.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/models/bn_screen.dart';
import 'package:rent_your_car/view/screens/app/settings_screen.dart';
import 'package:rent_your_car/view/screens/app/rents_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with Helpers {
  int _indexAdmin = 0;
  final List<BnScreen> _screensAdmin = [
    BnScreen(widget: const RentsScreen(), title: 'الإيجارات'),
    BnScreen(widget: const SettingsScreen(), title: 'الاعدادات'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_screensAdmin[_indexAdmin].title
          ),
        ),
        body: _screensAdmin[_indexAdmin].widget,
        bottomNavigationBar:
        bottomNavigationBarAdmin());
  }

  Widget bottomNavigationBarAdmin() {
    return BottomNavigationBar(
      currentIndex: _indexAdmin,
      onTap: (int v) {
        setState(() {
          _indexAdmin = v;
        });
      },
      selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.car_rental_outlined,
          ),
          activeIcon: Icon(
            Icons.car_rental,
          ),
          label: 'الايجارات',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings_outlined,
          ),
          activeIcon: Icon(
            Icons.settings,
          ),
          label: 'أعدادات',
        ),
      ],
    );
  }
}
