import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Model/skill.dart';

import '../Provider/user_profile_provider.dart';

import './user_profile_skill_tile.dart';

import '../Screen/non_domain_skills_screen.dart';
import '../Screen/domain_skills_screen.dart';

class UserProfileSkills extends StatelessWidget {
  const UserProfileSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final profileData = Provider.of<UserProfileProvider>(context);
    final List<Skill> listOfSkills = profileData.userSkills;
    final List<Skill> listOfOtherSkills =
        profileData.userProfile.nonDomainSpecificSkills;
    return Container(
      color: Colors.white,
      height: mediaSize.height,
      width: mediaSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(
              mediaSize.height * 0.005,
            ),
            child: SizedBox(
              height: mediaSize.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Domain Skills',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        DomainSkillScreen.routename,
                      );
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: mediaSize.height * 0.005,
            color: Colors.blue,
          ),
          SizedBox(
            height: mediaSize.height * 0.40,
            child: ListView.builder(
              itemCount: listOfSkills.length,
              itemBuilder: (ctx, index) => UserProfileSkillTile(
                isDomainSkill: true,
                skillSelected: listOfSkills[index],
              ),
            ),
          ),
          Divider(
            thickness: mediaSize.height * 0.005,
            color: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.all(
              mediaSize.height * 0.005,
            ),
            child: SizedBox(
              height: mediaSize.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Other Skills',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        NonDomainSkillScreen.routename,
                      );
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: mediaSize.height * 0.005,
            color: Colors.blue,
          ),
          SizedBox(
            height: mediaSize.height * 0.30,
            child: (listOfOtherSkills.isNotEmpty)
                ? ListView.builder(
                    itemCount: listOfOtherSkills.length,
                    itemBuilder: (ctx, index) => UserProfileSkillTile(
                      isDomainSkill: false,
                      skillSelected: listOfOtherSkills[index],
                    ),
                  )
                : Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          NonDomainSkillScreen.routename,
                        );
                      },
                      child: const Text('No Skills Added! Click here to Add'),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
