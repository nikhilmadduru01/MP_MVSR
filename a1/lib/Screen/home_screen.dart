import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Provider/user_profile_provider.dart';

import './domain_screen.dart';
import './user_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routename = './HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        height: mediaSize.height,
        width: mediaSize.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('HomeScreen'),
            Consumer<UserProfileProvider>(
              builder: (
                context,
                userData,
                _,
              ) =>
                  ElevatedButton(
                onPressed: () {
                  if (!userData.userCreated) {
                    Navigator.of(context).pushNamed(DomainScreen.routename);
                  } else {
                    Navigator.of(context)
                        .pushNamed(UserProfileScreen.routename);
                  }
                },
                child: (userData.userCreated)
                    ? const Text('My Profile')
                    : const Text('Search Domain'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
