import 'package:deneme8/main.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:camera/camera.dart';
import 'package:deneme8/main_screen.dart';
import 'package:deneme8/workouts.dart';

class HomeScreen extends StatefulWidget {

  final List<CameraDescription> cameras;
  HomeScreen(this.cameras);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    MainScreen(cameras),
    WorkOutPage(),
    Image.asset('images/construction.PNG', height: 10, width: 280),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFE7C7C),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(LineAwesomeIcons.universal_access_solid),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(LineAwesomeIcons.burn_solid),
            label: 'Egzersizler',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(LineAwesomeIcons.user),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white70,
        iconSize: 35.0,
        elevation: 80,
        onTap: _onItemTapped,
      ),

    );
  }
}
