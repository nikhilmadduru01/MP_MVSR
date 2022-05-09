import 'package:a2/screen/job_profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/job_profile_provider.dart';

import './domain_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routename = '/';
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
        title: const Text('Home Screen'),
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
            Consumer<JobProfileProvider>(
              builder: (
                context,
                jobData,
                _,
              ) =>
                  ElevatedButton(
                onPressed: () {
                  if (!jobData.jobCreated) {
                    Navigator.of(context).pushNamed(DomainScreen.routename);
                  } else {
                    Navigator.of(context).pushNamed(JobProfileScreen.routename);
                  }
                },
                child: (jobData.jobCreated)
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
