import 'package:flutter/material.dart';

import './skills_screen.dart';
import './domain_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routename = '/Home Screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Container(
        color: Colors.white,
        height: mediaSize.height,
        width: mediaSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  SkillsScreen.routename,
                );
              },
              child: const Text('Skill Screen'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  DomianScreen.routename,
                );
              },
              child: const Text('Domain Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
