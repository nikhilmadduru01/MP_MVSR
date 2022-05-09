import 'package:flutter/material.dart';

import '../Widgets/user_profile_home.dart';
import '../Widgets/user_profile_skills.dart';

import './home_screen.dart';

class UserProfileScreen extends StatefulWidget {
  static const routename = './profile_screen';
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final List<Widget> _widgetList = const [
    UserProfileHome(),
    UserProfileSkills(),
  ];

  int _selectedIndex = 0;

  void _toggleIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'Skills'),
        ],
        currentIndex: _selectedIndex,
        onTap: _toggleIndex,
      ),
      appBar: AppBar(
        title: const Text('User Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                HomeScreen.routename,
                (Route<dynamic> route) => false,
              );
            },
            icon: const Icon(
              Icons.home_outlined,
            ),
          ),
        ],
      ),
      body: _widgetList.elementAt(
        _selectedIndex,
      ),
    );
  }
}
