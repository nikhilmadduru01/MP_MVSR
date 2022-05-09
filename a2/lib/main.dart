import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './provider/domain_provider.dart';
import './provider/skill_provider.dart';
import './provider/job_profile_provider.dart';

import './screen/home_screen.dart';
import './screen/domain_screen.dart';
import './screen/domain_skills_screen.dart';
import './screen/skills_screen.dart';
import './screen/job_profile_screen.dart';
import './screen/non_domain_skills_screen.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DomainProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SkillProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => JobProfileProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          iconTheme: const IconThemeData(
            color: Colors.green,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.green,
          ),
          primaryColorLight: Colors.green,
          dividerColor: Colors.green,
          backgroundColor: Colors.green,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.green),
              textStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.green),
              ),
            ),
          ),
          primaryColor: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          DomainScreen.routename: (_) => const DomainScreen(),
          SkillScreen.routename: (_) => const SkillScreen(),
          JobProfileScreen.routename: (_) => const JobProfileScreen(),
          NonDomainSkillScreen.routename: (_) => const NonDomainSkillScreen(),
          DomainSkillScreen.routename: (_) => const DomainSkillScreen(),
        },
      ),
    );
  }
}
