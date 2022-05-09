import 'package:flutter/material.dart';

import '../widget/job_profile_home.dart';
import '../widget/job_profile_skills.dart';

import './home_screen.dart';

class JobProfileScreen extends StatefulWidget {
  static const routename = '/profile_screen';
  const JobProfileScreen({super.key});

  @override
  State<JobProfileScreen> createState() => _JobProfileScreenState();
}

class _JobProfileScreenState extends State<JobProfileScreen> {
  final List<Widget> _widgetList = const [
    JobProfileHome(),
    JobProfileSkills(),
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
        selectedItemColor: Colors.green,
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
            label: 'Skills',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _toggleIndex,
      ),
      appBar: AppBar(
        title: const Text('Job Profile'),
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
