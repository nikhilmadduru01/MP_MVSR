import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screen/home_screen.dart';
import './Screen/domain_screen.dart';
import './Screen/skills_screen.dart';
import './Screen/user_profile_screen.dart';
import './Screen/non_domain_skills_screen.dart';
import './Screen/domain_skills_screen.dart';

import './Provider/domain_provider.dart';
import './Provider/skill_provider.dart';
import './Provider/user_profile_provider.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          create: (_) => UserProfileProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          HomeScreen.routename: (_) => const HomeScreen(),
          DomainScreen.routename: (_) => const DomainScreen(),
          SkillScreen.routename: (_) => const SkillScreen(),
          UserProfileScreen.routename: (_) => const UserProfileScreen(),
          NonDomainSkillScreen.routename: (_) => const NonDomainSkillScreen(),
          DomainSkillScreen.routename: (_) => const DomainSkillScreen(),
        },
      ),
    );
  }
}
