import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/skill_provider.dart';
import './provider/domain_provider.dart';

import './screen/home_screen.dart';
import './screen/skills_screen.dart';
import './screen/domain_screen.dart';
import './screen/add_skills_for_domian_screen.dart';
import './screen/edit_skills_for_domain.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SkillProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DomainProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          HomeScreen.routename: (_) => const HomeScreen(),
          SkillsScreen.routename: (_) => const SkillsScreen(),
          DomianScreen.routename: (_) => const DomianScreen(),
          AddSkillsScreen.routename: (_) => const AddSkillsScreen(),
          EditSkillsForDomainScreen.routename: (_) =>
              const EditSkillsForDomainScreen(),
        },
      ),
    );
  }
}
