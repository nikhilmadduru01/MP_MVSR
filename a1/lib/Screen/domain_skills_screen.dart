import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Model/skill.dart';

import '../Provider/skill_provider.dart';
import '../Provider/user_profile_provider.dart';

import '../Screen/user_profile_screen.dart';

import '../Widgets/skill_list_tile.dart';
import '../Widgets/confirm_skill_tile.dart';

class DomainSkillScreen extends StatefulWidget {
  static const routename = './otherDomainSkills';
  const DomainSkillScreen({super.key});

  @override
  State<DomainSkillScreen> createState() => _DomainSkillScreenState();
}

class _DomainSkillScreenState extends State<DomainSkillScreen> {
  Future<void> _confirmOtherSkill(
    BuildContext context,
    UserProfileProvider userData,
  ) {
    List<Skill> tempSkillList = userData.tempSkills;
    return (tempSkillList.isNotEmpty)
        ? showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Skill Check List'),
              content: Builder(builder: (context) {
                final mediaSize = MediaQuery.of(context).size;
                return Container(
                  color: Colors.white,
                  height: mediaSize.height * 0.45,
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: mediaSize.height * 0.40,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: tempSkillList.length,
                          itemBuilder: (ctx, index) => ConfirmSkillTile(
                            selectedSkill: tempSkillList[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              actions: [
                TextButton(
                  onPressed: () {
                    userData.addOtherDomainSkilsToProfile();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      UserProfileScreen.routename,
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Confirm'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Go Back'),
                ),
              ],
            ),
          )
        : showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Check List Confirmation'),
              content: Builder(builder: (context) {
                final mediaSize = MediaQuery.of(context).size;
                return Container(
                  color: Colors.white,
                  height: mediaSize.height * 0.1,
                  width: double.maxFinite,
                  child: const Center(
                    child: Text(
                        'No Skills Are Selected\nPlease select atlease one skill to continue.'),
                  ),
                );
              }),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Okay'),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final skillsData = Provider.of<SkillProvider>(context);
    final userData = Provider.of<UserProfileProvider>(context);

    final List<Skill> listOfSkills = userData.totalOtherDomainSkills(
      skillsData.getSkillsList(
        userData.userProfile.userDomian.skillList,
      ),
    );

    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Skills'),
      ),
      body: Container(
        height: mediaSize.height,
        width: mediaSize.width,
        color: Colors.white,
        // ignore: unnecessary_null_comparison
        child: (listOfSkills.isNotEmpty)
            ? ListView.builder(
                itemCount: listOfSkills.length,
                itemBuilder: (ctx, index) => SkillListTile(
                  isDomain: true,
                  skillTile: listOfSkills[index],
                ),
              )
            : Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'No Skills Left To Add! Go Back!',
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _confirmOtherSkill(
            context,
            userData,
          );
        },
        child: const Icon(
          Icons.check_circle_outline,
        ),
      ),
    );
  }
}
