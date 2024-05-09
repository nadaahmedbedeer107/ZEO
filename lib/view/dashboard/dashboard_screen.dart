import 'package:flutter/material.dart';

import '../activity/activity.dart';
import '../home/home.dart';
import '../profile/profile.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ActivityScreen(),
    ProfileScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/home.png',height: 40,width: 40,),
            activeIcon: Image.asset('assets/img/home.png',height: 40,width: 40,color: Colors.blue,),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Image.asset('assets/img/activity.png',height: 30,width: 30,),
            activeIcon: Image.asset('assets/img/activity.png',height: 30,width: 30,color: Colors.blue,),

            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/profile.png',height: 30,width: 30,),
            activeIcon: Image.asset('assets/img/profile.png',height: 30,width: 30,color: Colors.blue,),

            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        selectedIconTheme:  const IconThemeData(color: Colors.blue),
        // selectedIconTheme: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
