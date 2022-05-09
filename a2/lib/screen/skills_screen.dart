import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/skill_provider.dart';
import '../provider/job_profile_provider.dart';

import '../model/skill.dart';
import '../model/domain.dart';

import '../widget/skill_list_tile.dart';
import '../widget/confirm_skill_tile.dart';

import '../screen/job_profile_screen.dart';
import '../screen/home_screen.dart';

class SkillScreen extends StatefulWidget {
  static const routename = '/SkillScreen';
  const SkillScreen({Key? key}) : super(key: key);

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  Future<void> _confirmSkillAndDomain(
      BuildContext context, Domain domain, JobProfileProvider userData) {
    List<Skill> tempSkillList = userData.tempSkills;
    return (tempSkillList.isNotEmpty)
        ? showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Profile Check'),
              content: Builder(builder: (context) {
                final mediaSize = MediaQuery.of(context).size;
                return Container(
                  color: Colors.white,
                  height: mediaSize.height * 0.45,
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(
                        thickness: mediaSize.height * 0.002,
                        color: Colors.green,
                      ),
                      SizedBox(
                        height: mediaSize.height * 0.005,
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.green,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Domain',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        title: Text(domain.domainName),
                      ),
                      SizedBox(
                        height: mediaSize.height * 0.005,
                      ),
                      Divider(
                        thickness: mediaSize.height * 0.002,
                        color: Colors.green,
                      ),
                      SizedBox(
                        height: mediaSize.height * 0.28,
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
                    userData.confirmProfileDetails();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      JobProfileScreen.routename,
                      ModalRoute.withName(HomeScreen.routename),
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
    final jobProfileData = Provider.of<JobProfileProvider>(context);
    final List<Skill> listOfSkills = skillsData.getSkillsList(
      jobProfileData.tempDomain.skillList,
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
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _confirmSkillAndDomain(
            context,
            jobProfileData.tempDomain,
            jobProfileData,
          );
        },
        child: const Icon(
          Icons.check_circle_outline,
        ),
      ),
    );
  }
}
